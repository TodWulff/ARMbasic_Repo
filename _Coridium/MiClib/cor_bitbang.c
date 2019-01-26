

#include "coridium_pcb.h"
#include "coridium.h"

#ifndef CR
 #define CR 			0xD
 #define LF 			0xA
 #define BACKSPACE	0x8
 #define TAB	 		0x09
#endif




void disableIRQ(void);
void enableIRQ(void);


#if defined __CORTEX_M || defined CORTEX_M0 || defined CORTEX_M3 || defined CORTEX_M4	

 #include "systick.h"
 
#else

///////////////////////////////////////////////////////////////
//
// WAIT in milliseconds
//
// 

// use WAITmicro for microseconds, avoid call overhead -- more accurate -- need to declare start to use it

#define WAITmicro(time)  {start=TIMER; while ((TIMER - start) < time) ;}
#define micros() TIMER

void WAIT( int time ) {
	int start1, start2;
	
	start1 = (int) LPC_TIM0->TC;				// use registers -- for speed
	start2 = time;
	if (start2 > 4200000) {		// handle long delays 
		while (start2--) {
			while (((int) LPC_TIM0->TC - start1) < 1000) ;
			start1 += 1000;		
		}
	} else {
		start2 *= 1000;
		while (((int) LPC_TIM0->TC - start1) < start2) ;
	}
}

#endif

///////////////////////////////////////////////////////////////////////////////
//
// manage lists for the various bit banged routines
//
// used to index thru the lists for various routines
unsigned char list_j, list_cnt;
int list_value;
char *Clist;

void initList(unsigned int cnt, char *list) {
	list_j = 0;
	list_cnt = cnt;
	Clist = list;		
}

// return -1 if no more data to send
// otherwise the data should be a 16 bit value (always >=0)


int readList (void) {
	if (list_cnt == 0) {
		if ((list_value == CR) || (list_value == LF) || (list_value == 0)) return 0;
	} else 	if (++list_j > list_cnt) return 0;
	list_value = *Clist++;		
	return 1;
}
	
int saveList (int val) {
	*Clist++ = val;	
	if (list_cnt == 0) {
		if ((list_value == CR) || (list_value == LF) || (list_value == 0)) return 0;
	} else if (++list_j >= list_cnt) return 0;
	return 1;
}



#define SET_SCL_HIGH	INPUTx(scl_pin)
#define SET_SDA_HIGH	INPUTx(sda_pin)
                                         
#define SET_SCL_LOW		{OUTPUTx(scl_pin);LOWx(scl_pin);}	
#define SET_SDA_LOW		{OUTPUTx(sda_pin);LOWx(sda_pin);}


int I2Cdelay;

void i2c_stall() 	{
	volatile int start;
	
	if (I2Cdelay) { 
  #ifdef LPC175x		// use to be a #define -- getting too complex there
  		I2Cdelay = 12;
  #else
  		I2Cdelay = 5;
  #endif
	}
	start = I2Cdelay; 
	while (start--);
}

void I2CSPEED(int rateKHz) {
  #ifdef LPC175x		// use to be a #define -- getting too complex there
  	if (rateKHz == 50) 			I2Cdelay = 130;
  	else if (rateKHz == 100) 	I2Cdelay = 65;
  	else						I2Cdelay = 12;
  #else
  	if (rateKHz == 50) 			I2Cdelay = 20;
  	else if (rateKHz == 100) 	I2Cdelay = 10;
  	else						I2Cdelay = 5;
  #endif
}

int i2c_start (int sda_pin, int scl_pin) {
	int start;
	
	SET_SCL_HIGH; SET_SDA_HIGH;			// don't drive SDA or SCL,  
	
	start = micros();
		
	while (micros()-start < 100000) {						

		if (INx(sda_pin) && INx(scl_pin)) {
			SET_SDA_LOW;					// drive SDA low
			i2c_stall();
			if ((INx(scl_pin)) == 0) {	// check we got control
				SET_SCL_HIGH; SET_SDA_HIGH;						// release both
			} else {
				SET_SCL_LOW;			// drive SCL low
				return 0;				// we got control
			}
		}
	}
	return -1;
}

void i2c_stop (int sda_pin, int scl_pin) {
	SET_SDA_LOW;		// drive SDA low

	i2c_stall();
	SET_SCL_HIGH;		// release SCL high
	i2c_stall();
	SET_SDA_HIGH;		// release SDA high
}

// shift out 8 bits, return ACK, leave SCL low, SDA float -- probably driven by slave for a bit

char i2c_shift (int sda_pin, int scl_pin, char value) {		// returns TRUE when ACK'd
	int i;
	
	i=7;
//	i2c_stall();
	while (i >= 0) {
		SET_SCL_LOW;		// drive SCL low
		i2c_stall();
		if (value & (1<<i)) { SET_SDA_HIGH;	}	// release SDA high
		else 				{ SET_SDA_LOW;	}	// drive SDA low
	// REMOVE THIS NEXT ONE FOR 400 KB RATE	
//		i2c_stall();
		SET_SCL_HIGH;		// release SCL high
		while ((INx(scl_pin)) ==0);		// allow clock stretching
		i2c_stall();
		i--;
	}
	SET_SCL_LOW;			// drive SCL low
	SET_SDA_HIGH;			// let SDA float
	i2c_stall();
	i2c_stall();
	SET_SCL_HIGH;			// release SCL high

	i2c_stall();
	i = INx(sda_pin);	// check ACK here (save value in i, 0 was ACK'd
	
	i2c_stall();
	SET_SCL_LOW;			// drive SCL low

	return i==0;			// was it ACK'd	
}



void I2CIN (int sda_pin, int scl_pin, int addr, int opt1, int opt2, int opt3, int opt4, int opt5, int cnt,char *list) {	// U16 to allow -1 for unused
	unsigned char itsOK;	// also set to 0 when last data sent
	unsigned char data;
	unsigned char i;
	
	initList(cnt,list);

	if (i2c_start(sda_pin, scl_pin)) return;	// was not able to get the bus
	itsOK = 1;

	if ((opt1 != -1)) {
		itsOK = i2c_shift(sda_pin, scl_pin, addr & 0xfe);
		if (itsOK) itsOK = i2c_shift(sda_pin, scl_pin, opt1);
		if ((opt2 != -1) && itsOK) itsOK = i2c_shift(sda_pin, scl_pin, opt2);
		if ((opt3 != -1) && itsOK) itsOK = i2c_shift(sda_pin, scl_pin, opt3);
		if ((opt4 != -1) && itsOK) itsOK = i2c_shift(sda_pin, scl_pin, opt4);
		if ((opt5 != -1) && itsOK) itsOK = i2c_shift(sda_pin, scl_pin, opt5);
	}
	
	if (itsOK) {	
		if (opt1 != -1) {
			SET_SDA_HIGH;			// release SDA high  
			i2c_stall();
			SET_SCL_HIGH;			// release SCL high 
			i2c_stall();
			SET_SDA_LOW;			// drive SDA low -- repeated START
		}

		if (i2c_shift(sda_pin, scl_pin, addr | 1)) {		// read this time
			do {
				data = 0;
				i = 8;
				while (i > 0) {
					SET_SCL_LOW;		// drive SCL low
					i2c_stall();
					i--;
					SET_SCL_HIGH;		// release SCL high
					i2c_stall();
					data |= INx(sda_pin) ? (1 << i) :0;
				}		
				SET_SCL_LOW;			// drive SCL low
				if ((itsOK = saveList(data))) SET_SDA_LOW;	// ACK for repeated read
				i2c_stall();
//				i2c_stall();
				i2c_stall();
				SET_SCL_HIGH;			// release SCL high
		
				i2c_stall();
//				master (me would ACK here for a sequenctial read				
				SET_SCL_LOW;			// drive SCL low
				SET_SDA_HIGH;			// release SDA high  
//				i2c_stall();

			} while (itsOK);
		}
	} 
	i2c_stop(sda_pin, scl_pin);
}


int I2COUT (int sda_pin, int scl_pin, int addr, int cnt, char *list) {
	unsigned char itsOK;

	initList(cnt,list);
	
	if (i2c_start(sda_pin, scl_pin)) return -1;	// was not able to get the bus
	itsOK = i2c_shift(sda_pin, scl_pin, addr & 0xfe);
	
	if (itsOK) {
		while (readList() > 0) {
			if (!i2c_shift(sda_pin, scl_pin, list_value)) { itsOK = 0; break; }
		}
	}

	i2c_stop(sda_pin, scl_pin);	
	return itsOK;
}



///////////////////////////////////////////////////////////////////////
//
// bit banged serial routines
//
int SERbauds[31];

int lastBitTime;
char lastSERpin = -1;

void xmit_byte(int pin, int posTrue, int chr)
{				 
	int  i, start;

	if (lastSERpin != pin)	lastBitTime = ( 2000000 / SERbauds[pin] + 1 ) >>1;	// round the value up gets within 3% for 115Kb
	
	chr = (chr<<1) | 0x600;		// add start and stop bit  -- 2 stop bits needed??, no but have to wait for 1 to go out

	disableIRQ();
		
	OUTPUTx(pin);					// hopefully this avoids the false TX
	if (posTrue) 	{HIGHx(pin);}
	else			{LOWx(pin); chr = ~ chr;}
	
    for (i=0;i<11;i++){
   		if(chr & 1) {
			HIGHx(pin);
		} else {
			LOWx(pin);
		}
    	chr >>= 1;
    	WAITmicro(lastBitTime);
	}
	enableIRQ();
}


int  SERINtimeout = 500000;

int  recv_byte(int pin, int posTrue) {
	int  chr, i, start;

	INPUTx(pin);
	
	if (lastSERpin != pin)	lastBitTime = ( 2000000 / SERbauds[pin] + 1 ) >>1;	// round the value up gets within 3% for 115Kb
		
	chr = 0;
	start = micros();
	if (posTrue) {
	   	while((INx(pin)) == 0){ 
		   	if (micros() > (SERINtimeout>>3))  return -1;}	//wait for stop/idle
		while(INx(pin)){ 
			if (micros() > SERINtimeout)  return -1;}	//wait for start bit
	} else {                                                                    
		while(INx(pin)){ 
			if (micros() > (SERINtimeout>>3))  return -1;}	//wait for stop/idle
	   	while((INx(pin)) == 0){ 
		   	if (micros() > SERINtimeout)  return -1;}	//wait for start bit
	}
	
	disableIRQ();			// takes nearly 2usec
	WAITmicro(lastBitTime >> 1);	// waits 1/2 baud time -- using the 1usec ticker

	for (i=0;i<8;i++){			// only need to sample 8 times
    	chr >>= 1;
		WAITmicro(lastBitTime);
   		if (INx(pin))	chr |= 0x80;
	}    
	enableIRQ();
	
	return posTrue ? chr : (chr ^ 0xFF);
}


int SERIN (int pin, int baud, int posTrue, int cnt, char *list)
{				 
	int  chr;
	
	initList(cnt, list);
	SERbauds[pin] = baud;

	do {
		chr = recv_byte(pin, posTrue);
		if (chr < 0) {saveList(255); return -1;}
	} while (saveList(chr));
	
	lastSERpin = -1;
	return 0;
}


void SEROUT(int pin, int baud, int posTrue, int cnt, char *list)
{				 
	initList(cnt,list);
	SERbauds[pin] = baud;
	
	while (readList() > 0) {
		xmit_byte(pin, posTrue, list_value);
	}
	
	lastSERpin = -1;
}	



void PWM(int pin, int duty, int duration){
	int start;
	int start1, start2;

	start2 = duty & 0xFF;
	
	duration = duration * 1000;
	
	OUTPUTx(pin);
	
	disableIRQ();
	
	if(start2) {
		HIGHx(pin);
	} else {
		LOWx(pin);
	}

	start = micros();				
			
	if(start2==0 || start2==255){
		while ((micros() - start) < duration) ;
	}else{
		while ((micros() - start) < duration) {
			start1 = start2;
			while(start1)start1--;
			LOWx(pin);
			start1 = 256-start2;
			while(start1)start1--;
			HIGHx(pin);
		}
	}
	enableIRQ();
	
	INPUTx(pin);
}



int RCTIME(int pin, int state) {
	int start;

	INPUTx(pin);

	if(state==1)			//opposite pulsin
		state = -1;
	else
		state = 0;
	
	if(state != INx(pin)){
		return 1;			//PBasic returns 1 if its not in state
	}
	start = micros();				// start  -- 

	while ((micros() - start) < 1000000){//1,000,000us
		if(state != INx(pin)){
			break;
		}
	}
	
	if((micros() - start) >= 1000000)//1 second timeout
		return 0;	//timeout too long
	
	return (micros() - start);
}



int PULSIN (int pin, int state){
	int start;
	
	INPUTx(pin);
	
	if(state==1)			
		state = 0;
	else
		state = -1;
	

	start = micros();				// start  -- 
	
	while(state != INx(pin)){
		if(((int) micros() - start) > 1000000){		//1,000,000us
			return 0;								//timeout no pre transition
		}
	}

	start = micros();				// start  -- 
	while(state == INx(pin)){
		if(((int) micros() - start) > 1000000){		//1,000,000us
			return 0;								//timeout no transition
		}
	}

	start = micros();				// start  -- 
	while (((int) micros() - start) < 1000000){//1 second timeout
		if(state == INx(pin)){
			break;
		}
	}
	
	if(((int) micros() - start) >= 1000000)//1 second timeout
		return 0;//timeout too long

	return (micros() - start);
}


void PULSOUT (int pin, int duration){
	int start;

	int value;
	
	OUTPUTx(pin);

	start = (int) micros();				// start  

	value = INx(pin);
	if(value==0) {
		HIGHx(pin);
	} else {
		LOWx(pin);
	}

	while (((int)micros() - start) < duration) ;	// no longer hangs on - numbers
	
	if(value==0) {
		LOWx(pin);
	} else {
		HIGHx(pin);
	}
}



int COUNT(int pin, int duration) {
	int state,nustate,i,count, start;
	
	INPUTx(pin);
	i = count = 0;

	state = INx(pin);

	duration = duration * 1000;
	start = micros();				
			
	while (((int) micros() - start) < duration) {
		nustate = INx(pin);
		if (state != nustate) {
			count++;
			state = nustate;
		}
		i++;
	}
	return (count+1) >> 1;	// we counted transitions so divide by 2 for pulses (round up)
}





void SHIFTOUT (int scl_pin, int sdo_pin, int mode, int cnt, int *list, int bitLength) {
	int i,val;
	unsigned int mask;

	initList(cnt,0);

	if (bitLength == 0) bitLength = 8;
		
	OUTPUTx(sdo_pin);				// drive data out
	LOWx(sdo_pin);					// and set it low
	
	SET_SCL_LOW; SET_SCL_LOW;			// initial condition drive them low
	
	while (list_cnt-- > 0) {
		val = list[list_j++];
		if (mode == 0) {	
			for (i=0; i< bitLength; i++) {
				mask = 1 << i;
				if (val & mask) 	{HIGHx(sdo_pin);}
				else 				{LOWx(sdo_pin);}
				SET_SCL_HIGH;
				SET_SCL_LOW;
			}
		} else {			
			for (i=bitLength; i>0;) {
				i--;
				mask = 1 << i;
				if (val & mask) 	{HIGHx(sdo_pin);}
				else 				{LOWx(sdo_pin);}
				SET_SCL_HIGH;
				SET_SCL_LOW;
			}
		}
	}
}



/* MAR */void SHIFTIN (int sda_pin, int scl_pin, int mode, int cnt, int *list, int bitLength) {
/* MAR */	int i,val;

/* MAR */	initList(cnt, 0);
/* MAR */	
/* MAR */	if (bitLength == 0) bitLength = 8;
/* MAR */	
/* MAR */	SET_SCL_LOW; SET_SCL_LOW;	
/* MAR */	SET_SDA_HIGH;	//	sdi is an input	

/* MAR */	do {
/* MAR */		val = 0;
/* MAR */		if (mode == 1) {									// LSB first
/* MAR */			for (i=0; i< bitLength; i++) {
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  pre mode
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */			}
/* MAR */		} else if (mode == 3) {
/* MAR */			for (i=0; i< bitLength; i++) {
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  post mode
/* MAR */			}
/* MAR */		} else if (mode == 0) {								// MSB first
/* MAR */			for (i=bitLength; i>0;) {
/* MAR */				i--;
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  pre mode
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */			}
/* MAR */		} else if (mode == 2) {
/* MAR */			for (i=bitLength; i>0;) {
/* MAR */				i--;
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  post mode
/* MAR */			}
/* MAR */		}
/* MAR */		list [list_j++] = val;
/* MAR */	} while (--list_cnt);
/* MAR */}


/* MAR */void SHIFTBI (int sda_pin, int scl_pin, int sdo_pin, int mode, int cnt, int *outlist, int *inlist, int bitLength) {
/* MAR */	int i,val;

/* MAR */	initList(cnt, 0);
/* MAR */	
/* MAR */	SET_SCL_LOW; SET_SCL_LOW;	
/* MAR */	SET_SDA_HIGH;	

/* MAR */	if (bitLength == 0) bitLength = 8;
/* MAR */	
/* MAR */	OUTPUTx(sdo_pin);				// drive data out
/* MAR */	LOWx(sdo_pin);					// and set it low

/* MAR */	do {
/* MAR */		val = 0;
/* MAR */		if (mode == 1) {									// LSB first
/* MAR */			for (i=0; i< bitLength; i++) {
/* MAR */				if (outlist[list_j] & (1 << i)) {HIGHx(sdo_pin);}
/* MAR */				else {LOWx(sdo_pin);}
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  pre mode
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */			}
/* MAR */		} else if (mode == 3) {
/* MAR */			for (i=0; i< bitLength; i++) {
/* MAR */				if (outlist[list_j] & (1 << i)) {HIGHx(sdo_pin);}
/* MAR */				else {LOWx(sdo_pin);}
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  post mode
/* MAR */			}
/* MAR */		} else if (mode == 0) {								// MSB first
/* MAR */			for (i=bitLength; i>0;) {
/* MAR */				i--;
/* MAR */				if (outlist[list_j] & (1 << i)) {HIGHx(sdo_pin);}
/* MAR */				else {LOWx(sdo_pin);}
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  pre mode
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */			}
/* MAR */		} else if (mode == 2) {
/* MAR */			for (i=bitLength; i>0;) {
/* MAR */				i--;
/* MAR */				if (outlist[list_j] & (1 << i)) {HIGHx(sdo_pin);}
/* MAR */				else {LOWx(sdo_pin);}
/* MAR */				SET_SCL_HIGH; SET_SCL_LOW;
/* MAR */				val |= (INx(sda_pin))? (1 << i) :0;		//  post mode
/* MAR */			}
/* MAR */		}
/* MAR */		inlist [list_j++] = val;
/* MAR */	} while (--list_cnt);
/* MAR */}


/* MAR *////////////////////////////////////////////////////////////////////////////////////
/* MAR *///
/* MAR */// SPIshiftOut
/* MAR *///	subroutine used to shift out a byte to an SPI device

/* MAR */char SPImode = 1;	// sets LSB/MSB first, initial clock or not

/* MAR */void SPIshiftOut(int clkpinMask, int outpinMask, int outByte) {
/* MAR */	int i;
/* MAR */	if (SPImode & 1) {		// LSB first
/* MAR */		for (i=0;i<8;i++) {
/* MAR */			if (outByte & (1<<i))  	{HIGHx(outpinMask);}
/* MAR */			else			  		{LOWx(outpinMask);}
/* MAR */			HIGHx(clkpinMask);
/* MAR */			LOWx(clkpinMask);
/* MAR */		}
/* MAR */	} else {				// MSB first
/* MAR */		for (i=0;i<8;i++) {
/* MAR */			if (outByte & (0x80 >> i))	{HIGHx(outpinMask);}
/* MAR */			else			  			{LOWx(outpinMask);}
/* MAR */			HIGHx(clkpinMask);
/* MAR */			LOWx(clkpinMask);
/* MAR */		}
/* MAR */	}
/* MAR */}

/* MAR */void SPIIN (int cspin, int inpin, int clkpin, int outpin, int out1, int out2, int out3, int cnt, char *list) {
/* MAR */	int i;
/* MAR */	int val;

/* MAR */	// convert pin values to mask values to GPIO registers
/* MAR */		

/* MAR */	if (SPImode & 2) {HIGHx(clkpin);}		// negative clock -- normally high
/* MAR */	else		  	 {LOWx(clkpin);}
/* MAR */	if (cspin>=0)HIGHx(cspin);				// cs and outpin high to start with
/* MAR */	if (outpin>=0)HIGHx(outpin);

/* MAR */	if (cspin>=0)OUTPUTx(cspin);		// and other pins to be outputs
/* MAR */	INPUTx(inpin);						// force inpin to be an input
/* MAR */	OUTPUTx(clkpin);		// and other pins to be outputs
/* MAR */	if (outpin>=0)OUTPUTx(outpin);		// and other pins to be outputs

/* MAR */	
/* MAR */	initList(cnt,list);
/* MAR */	if (cspin>=0) LOWx(cspin);

/* MAR */	if (out1 >=0 ) SPIshiftOut(clkpin,outpin,out1);
/* MAR */	if (out2 >=0 ) SPIshiftOut(clkpin,outpin,out2);
/* MAR */	if (out3 >=0 ) SPIshiftOut(clkpin,outpin,out3);

/* MAR */	INPUTx(inpin);					// force inpin to be an input, done here allows inpin == outpin

/* MAR */	if (SPImode & 1) {		// LSB first
/* MAR */		do {
/* MAR */			val = 0;
/* MAR */			for (i=0; i< 8; i++) {
/* MAR */				HIGHx(clkpin);
/* MAR */				LOWx(clkpin);		
/* MAR */				if (INx(inpin)) val |= (1<<i);	
/* MAR */			}
/* MAR */		} while (saveList(val));
/* MAR */	} else {				// MSB first
/* MAR */		do {
/* MAR */			val = 0;
/* MAR */			for (i=0; i< 8; i++) {
/* MAR */				HIGHx(clkpin);
/* MAR */				LOWx(clkpin);		
/* MAR */				if (INx(inpin)) val |= (0x80 >> i);	
/* MAR */			}
/* MAR */		} while (saveList(val));
/* MAR */	}
/* MAR */	
/* MAR */	if (SPImode & 2) {HIGHx(clkpin);}		// negative clock -- normally high
/* MAR */	if (cspin>=0)HIGHx(cspin);
/* MAR */}

/* MAR */void SPIBI (int cspin, int inpin, int clkpin, int outpin, int out1, int out2, int out3, int cnt, char *list) {
/* MAR */	int i,j,m;
/* MAR */	int val, outByte;

/* MAR */	// convert pin values to mask values to GPIO registers
/* MAR */		

/* MAR */	if (SPImode & 2) {HIGHx(clkpin);}		// negative clock -- normally high
/* MAR */	else			 {LOWx(clkpin);}
/* MAR */	if (cspin>=0)HIGHx(cspin);				// cs and outpin high to start with
/* MAR */	HIGHx(outpin) ;

/* MAR */	if (cspin>=0)OUTPUTx(cspin);			// and other pins to be outputs
/* MAR */	INPUTx(inpin);			// force inpin to be an input
/* MAR */	OUTPUTx(clkpin);		// and other pins to be outputs
/* MAR */	OUTPUTx(outpin);		// and other pins to be outputs

/* MAR */	initList(cnt,list);
/* MAR */	if (cspin>=0)LOWx(cspin);

/* MAR */	j=0;
/* MAR */	do {
/* MAR */		val = 0;
/* MAR */		if (j==0) 		outByte = out1;
/* MAR */		else if (j==1)  outByte = out2;
/* MAR */		else 			outByte = out3;
/* MAR */		for (i=0; i< 8; i++) {
/* MAR */			if (SPImode & 1) m = 1<<i; else m = 0x80 >> i;
/* MAR */			if (outByte & m)  {HIGHx(outpin);}
/* MAR */			else			  {LOWx(outpin);}
/* MAR */			if (INx(inpin)) val |= m;	
/* MAR */			HIGHx(clkpin);
/* MAR */			LOWx(clkpin);
/* MAR */		}
/* MAR */		j++;
/* MAR */	} while (saveList(val));
/* MAR */	
/* MAR */	if (SPImode & 2) {LOWx(clkpin);}		// negative clock -- normally high
/* MAR */	if (cspin>=0)HIGHx(cspin);
/* MAR */}


/* MAR */void SPIOUT (int cspin, int clkpin, int outpin, int cnt, char *list) {

/* MAR */	// convert pin values to mask values to GPIO registers

/* MAR */	if (SPImode & 2) {HIGHx(clkpin);}		// negative clock -- normally high
/* MAR */	else			 {LOWx(clkpin);}
/* MAR */	if (cspin>=0)HIGHx(cspin);				// cs and outpin high to start with
/* MAR */	HIGHx(outpin);

/* MAR */	if (cspin>=0)OUTPUTx(cspin);		// and other pins to be outputs
/* MAR */	OUTPUTx(clkpin);		// and other pins to be outputs
/* MAR */	OUTPUTx(outpin);		// and other pins to be outputs

/* MAR */	if (cspin>=0)LOWx(cspin);
/* MAR */	LOWx(clkpin);
/* MAR */	if (SPImode & 2) {
/* MAR */		HIGHx(clkpin);
/* MAR */		LOWx(clkpin);
/* MAR */	}

/* MAR */	initList(cnt,list);
/* MAR */	
/* MAR */	while (readList() > 0) {
/* MAR */		SPIshiftOut(clkpin,outpin,list_value);
/* MAR */	}
/* MAR */	
/* MAR */	if (SPImode & 2) {LOWx(clkpin);}		// negative clock -- normally high
/* MAR */	HIGHx(cspin);
/* MAR */}


#define OWFLOAT		INPUTx(pin)
#define OWLOW		{OUTPUTx(pin);LOWx(pin);}

char ow_reset(int pin) {
	int start, start2;
	
	OWFLOAT;
	LOWx(pin);		// when drive it will go low
	start = micros();
	while ((micros() - start) < 10);	// allow rise time for initial starting point
	OWLOW;
	start = micros();
	while ((micros() - start) < 500);	// hold line low for >480 uS for reet
	OWFLOAT;
	start2 = micros();
	while ((micros() - start2) < 15);	// allow rise time and rest time
	start = micros();
	while ((micros() - start) < 60) if((INx(pin)) == 0) break; // wait for low going pulse
	start = micros();
	while ((micros() - start) < 20);	// wait for sample time
	start = INx(pin);		// double duty on start used for presence return
	while ((micros() - start2) < 500);	// presence pulse time period
	return start == 0;
}

void ow_sendbyte(int pin, int data) {
	int i, start;
	
	for (i=0; i<8; i++) {
		start = micros();
		OWLOW;
		while ((micros() - start) < 5);	// lead pulse of data
		if (data & (1 << i)) OWFLOAT;
		while ((micros() - start) < 90);	// remaining time of data pulse
		OWFLOAT;
		while ((micros() - start) < 100);	// rest period
	}
}


void OWIN (int pin, int out1,int out2,int out3,int out4,int out5, int out6, int cnt, char *list) {
	int chr, start, i;
	
	initList(cnt,list);
	
	disableIRQ();
	ow_reset(pin);
	
	if (out1 >=0) ow_sendbyte (pin, out1);
	if (out2 >=0) ow_sendbyte (pin, out2);
	if (out3 >=0) ow_sendbyte (pin, out3);
	if (out4 >=0) ow_sendbyte (pin, out4);
	if (out5 >=0) ow_sendbyte (pin, out5);
	if (out6 >=0) ow_sendbyte (pin, out6);

	do {
		chr = 0;
	    for (i=0;i<8;i++){
		    OWLOW;
		    start = micros();
		    OWFLOAT;				// slave should take over
			while ((micros() - start) < 10);	// sample period
//			while ((micros() - start) < 20);	// sample period -- breaks at 30 --TI wants 15
   			if(INx(pin))	chr |= (1 << i);
			while ((micros() - start) < 100);	// slot period
   		}    
	} while (saveList(chr));
	enableIRQ();
}

int OWOUT (int pin, int cnt, char *list) {
	char temp;
	
	initList(cnt,list);
	pin = 1<<pin;		// convert to a mask value
	
	disableIRQ();
	temp = ow_reset(pin);
	while (readList() > 0) {
		ow_sendbyte (pin, list_value);
	}
	enableIRQ();
	return temp;
}


#if defined LPC_RTC && !(defined LPC15xx)

const unsigned char day_cnt[11] = {31,28,31,30,31,30,31,31,30,31,30};//december doesn't count

void count_the_days(void){
	int day, i;
	
	day = LPC_RTC->DOM;
	for(i = 0; i < ((int) LPC_RTC->MONTH - 1); i++)//MONTH IS 1 BASED
		day += day_cnt[i];

	if((LPC_RTC->YEAR & 0x3) == 0 && LPC_RTC->MONTH > 2)
		day++;
	
	LPC_RTC->DOY = day;

	i = 2006;//lucky, 1/1/06 was sunday
	while(i < (int) LPC_RTC->YEAR){
		day += 365;
		if((i & 0x3) == 0)
			day++;
		i++;
	}
	
	LPC_RTC->DOW	= --day % 7;	//DayOfYear is 1 based, DayOfWeek is 0 based
}

#endif

int atoi(char * string) {
	int x,d;
	
	x=0;
	while ((d = *string++)) {
		x = x*10 + (d - '0');
	}
	return x;
}


void timer_tick_init(void) {
	
#ifdef __CORTEX_M
	
#elif defined LPC1114 || defined LPC11Uxx || defined LPC11U6X // DOES 6X belong here
	// Setup Timer0 Compare-Match Interrupt         
	// 1us prescaler timer runs at cclk = FOSC/PLL_M 
	//LPC_TIM0->PR  = PCLK/1000000-1;				//1 us prescaler
	LPC_TIM0->PR  = (SystemCoreClock/1000000)-1;				//1 us prescaler
	LPC_TIM0->TC  = 0;
	LPC_TIM0->TCR = 1;//TxTCR_COUNTER_ENABLE;          // Timer0 Enable

	LPC_TIM1->PR  = (SystemCoreClock/1000)-1;				//1 ms prescaler
	LPC_TIM1->TC  = 0;
	LPC_TIM1->TCR = 1;          					// Timer1 Enable
#else	
	// Setup Timer0 Compare-Match Interrupt         
	// 1us prescaler timer runs at cclk = FOSC/PLL_M 
	//LPC_TIM0->PR  = PCLK/1000000-1;				//1 us prescaler
	LPC_TIM0->PR  = (SystemCoreClock/4/1000000)-1;				//1 us prescaler
	LPC_TIM0->TC  = 0;
	LPC_TIM0->TCR = 1;//TxTCR_COUNTER_ENABLE;          // Timer0 Enable

	LPC_TIM1->PR  = (SystemCoreClock/4/1000)-1;				//1 ms prescaler
	LPC_TIM1->TC  = 0;
	LPC_TIM1->TCR = 1;          					// Timer1 Enable
#endif	
}	



//////////////////////////////////////////////////////////////////////////////////////////
//
//	the following are obsolete function calls that are not supported
//

#ifdef _COR_HWLIB_H

void FREQOUT(int a, int b, int c, int d) {
	printf("\n\n*** FREQOUT is no longer part of the bitbanged library ***\n\n");
}
void SLEEP(int a) {
	printf("\n\n*** SLEEP is no longer part of the bitbanged library ***\n\n");
}

#endif
