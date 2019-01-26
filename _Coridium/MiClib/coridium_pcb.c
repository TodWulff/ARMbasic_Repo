
#include "coridium_pcb.h"

//////////////////////////////////////////////////////////////////////
//
// ARMmite, PRO and ARMexpress boards map the NXP defined P0.0 thru P0.31 to
// pins along the edge of the PCB that were convenient for the layout
//
// the trend of future boards is to just name them as NXP does, but to
// keep with earlier programs that take advantage of that remapping this set
// of definitions handles that -- note that it does require some overhead
//

#ifdef mitePRO
 const char pinlist[] = {9,8,27,19,28,21,5,29, 30,16,7,13,4,6,20,15, 22,23,24,10,11,12,25,26, 0,1,2,3,14,17,18,31};
 const int  pinmap[] = {1<<9, 1<<8, 1<<27, 1<<19, 1<<28, 1<<21, 1<<5, 1<<29,
 					   1<<30, 1<<16, 1<<7, 1<<13, 1<<4, 1<<6, 1<<20, 1<<15,
 					   1<<22, 1<<23, 1<<24, 1<<10, 1<<11, 1<<12, 1<<25, 1<<26,
 					   1<<0, 1<<1, 1<<2, 1<<3, 1<<14,1<<17, 1<<18, 1<<31};
 
#elif defined ARMmite
// const char pinlist[] = {9,8,30,21,20,29,4,5, 6,7,13,19,18,17,16,15, 22,23,24,10,11,12,25,26, 0,1,2,3,14,27,28,31};	 
// const int pinmap[]  = {1<<9, 1<<8, 1<<30, 1<<21, 1<<20, 1<<29, 1<<4, 1<<5, 
// 						1<<6, 1<<7, 1<<13, 1<<19, 1<<18, 1<<17, 1<<16, 1<<15, 
// 						1<<22, 1<<23, 1<<24, 1<<10, 1<<11, 1<<12, 1<<25, 1<<26, 
// 						1<<0, 1<<1, 1<<2, 1<<3, 1<<14, 1<<27, 1<<28, 1<<31};	 
 
#elif defined ARMexpress
 const char pinlist[] = {27,28,29,30,31,2,3,22, 24,12,23,25,26,13,15,16};
 const int pinmap[]  = {1<<27, 1<<28, 1<<29, 1<<30, 1<<31, 1<<2, 1<<3, 1<<22, 
 						1<<24, 1<<12, 1<<23, 1<<25, 1<<26, 1<<13, 1<<15, 1<<16};
 
#elif defined ARMexpLITE
 const char pinlist[] = {27,28,29,30,4,9,8,22, 24,12,23,25,26,13,15};
 const int pinmap[]  = {1<<27, 1<<28, 1<<29, 1<<30, 1<<4, 1<<9, 1<<8, 1<<22, 
 						1<<24, 1<<12, 1<<23, 1<<25, 1<<26, 1<<13, 1<<15};
 
#else
#endif


////////////////////////////////////////////////////////////////////////////////////
//
//   hacks for Yagarto 4.6.0  -- the list is growing...

#if (__GNUC__ == 4) && (__GNUC_MINOR__ == 6) //&& (__GNUC_PATCHLEVEL__ == 0)

  // this is an evil hack to disable all the unwind stuff generated in 4.6.0
  char __aeabi_unwind_cpp_pr0[0];
  //
  // why does it work ??? 

#endif

// this assumes that all GPIO ports are defined like LPC54102, ie. an array [32]
// get a hardware fault accessing ports that don't exist -- OK

#if defined LPC1114 || defined LPC1756 || defined LPC1751	// this code should go into alt_io


int DIR(int pin) {
	if(pin < 32)
	{
		if(LPC_GPIO0->DIR & (1<<pin))	return -1;
		else 								return 0;
	}
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO1->DIR & (1<<pin)) 	return -1;
		else 							return 0;
	}
#ifdef LPC_GPIO2	
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO2->DIR & (1<<pin)) 	return -1;
		else 							return 0;
	}
#endif
#ifdef LPC_GPIO3	
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO3->DIR & (1<<pin)) 	return -1;
		else 							return 0;
	}
#endif
#ifdef LPC_GPIO4	
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO4->DIR & (1<<pin)) 	return -1;
		else 							return 0;
	}
#endif
	return 0;
}


int IN(int pin) {			// LPC1114
	if(pin < 32)
	{
		if(LPC_GPIO0->DATA & (1<<(pin-32))) return -1;
		else 						 		return 0;
	}
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO1->DATA & (1<<pin)) 		return -1;
		else 						 		return 0;
	}
#ifdef LPC_GPIO2	
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO2->DATA & (1<<pin)) 		return -1;
		else 						 		return 0;
	}
#endif
#ifdef LPC_GPIO3	
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO3->DATA & (1<<pin)) 		return -1;
		else 						 		return 0;
	}
#endif
#ifdef LPC_GPIO4	
	pin -= 32;
	if(pin < 32)
	{
		if(LPC_GPIO4->DATA & (1<<pin)) 		return -1;
		else 						 		return 0;
	}
#endif
	return 0;
}

void INPUT(int pin) {			// LPC1114
	if(pin < 32) {
		LPC_GPIO0->DIR &= ~(1<<(pin-32)); return;
	}
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO1->DIR &= ~(1<<(pin-32)); return;
	}
#ifdef LPC_GPIO2	
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO2->DIR &= ~(1<<(pin));	return;
	}
#endif
#ifdef LPC_GPIO3	
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO3->DIR &= ~(1<<(pin));	return;
	}
#endif
#ifdef LPC_GPIO4	
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO4->DIR &= ~(1<<(pin));	return;
	}
#endif
}


void OUTPUT(int pin) {			// LPC1114
	if(pin < 32) {
		LPC_GPIO0->DIR |= (1<<(pin-32)); return;
	}
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO1->DIR |= (1<<(pin)); return;
	}
#ifdef LPC_GPIO2	
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO2->DIR |= (1<<(pin)); return;
	}
#endif
#ifdef LPC_GPIO3	
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO3->DIR |= (1<<(pin)); return;
	}
#endif
#ifdef LPC_GPIO4	
	pin -= 32;
	if(pin < 32) {
		LPC_GPIO4->DIR |= (1<<(pin)); return;
	}
#endif
}

void HIGH(int pin) {			// LPC1114
	if(pin < 32) {
		LPC_GPIO0->DIR |= (1<<(pin-32));
		LPC_GPIO0->DATA |= (1<<(pin-32));
		return;
	}
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO1->DIR |= (1<<(pin));
		LPC_GPIO1->DATA |= (1<<(pin));
		return;
	}
#ifdef LPC_GPIO2	
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO2->DIR |= (1<<(pin));
		LPC_GPIO2->DATA |= (1<<(pin));
		return;
	}
#endif
#ifdef LPC_GPIO3	
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO3->DIR |= (1<<(pin));
		LPC_GPIO3->DATA |= (1<<(pin));
		return;
	}
#endif
#ifdef LPC_GPIO4	
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO4->DIR |= (1<<(pin));
		LPC_GPIO4->DATA |= (1<<(pin));
	}
#endif
}

void LOW(int pin) {			// LPC1114
	if(pin < 32) {
		LPC_GPIO0->DIR |= (1<<(pin-32));
		LPC_GPIO0->DATA &= ~(1<<(pin-32));
		return;
	}
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO1->DIR |= (1<<(pin));
		LPC_GPIO1->DATA &= ~(1<<(pin));
	}
#ifdef LPC_GPIO2	
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO2->DIR |= (1<<(pin));
		LPC_GPIO2->DATA &= ~(1<<(pin));
		return;
	}
#endif
#ifdef LPC_GPIO3	
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO3->DIR |= (1<<(pin));
		LPC_GPIO3->DATA &= ~(1<<(pin));
		return;
	}
#endif
#ifdef LPC_GPIO4	
	pin -= 32;
	if(pin < 32)
	{
		LPC_GPIO4->DIR |= (1<<(pin));
		LPC_GPIO4->DATA &= ~(1<<(pin));
	}
#endif
}

#else

int DIR(int pin) 	{		// read the pin direction - 1 = output
	int port;
	port = pin >> 5;		// convert to port, pin bit
	pin &= 0x1f;
	if(LPC_GPIO->DIR[port] & (1<<(pin)))	return -1;
		else 						 	   	return  0;
}
int IN(int pin) 	{		// read the pin			  - 1 = high
	int port;
	port = pin >> 5;		// convert to port, pin bit
	pin &= 0x1f;
	if(LPC_GPIO->PIN[port] & (1<<(pin)))	return -1;
		else 						 	   	return  0;
}

void INPUT(int pin)	{		// and now an input
	int port;
	port = pin >> 5;		// convert to port, pin bit
	pin &= 0x1f;
	LPC_GPIO->DIR[port] &=  ~(1<<(pin));	
}
void OUTPUT(int pin){		// and now an output
	int port;
	port = pin >> 5;		// convert to port, pin bit
	pin &= 0x1f;
	LPC_GPIO->DIR[port] |=  (1<<(pin));	
}
void HIGH(int pin) 	{		// set the pin high
	int port;
	port = pin >> 5;		// convert to port, pin bit
	pin &= 0x1f;
	LPC_GPIO->DIR[port] |=  (1<<(pin));	
	LPC_GPIO->SET[port] =  (1<<(pin));	
}
void LOW(int pin) 	{		// clear the pin to low
	int port;
	port = pin >> 5;		// convert to port, pin bit
	pin &= 0x1f;
	LPC_GPIO->DIR[port] |=  (1<<(pin));	
	LPC_GPIO->CLR[port] =  (1<<(pin));	
}

void settimer(int time){
#if defined SysTick			//		LPC812 || defined LPC15xx
	ms65_count = time>>16; SysTick->VAL  = 0;	// any write writes 0s to VAL  (SYSTICK_RELOAD_VAL>>16) * (reg_accum & 0xffff);}
#else
	LPC_TIM0->TCR=0; LPC_TIM0->TC = time; LPC_TIM0->TCR=1;
#endif
}

#ifdef FOR_BASIC
int adin(int channel) {
	IO2AD(channel);			// convert the pin to AD operation
	return AD(channel);
}
#endif

void intsw(int enable) {			// actually just throws the I switch in the CPSR
	if (enable) 	enableIRQ();
	else 			disableIRQ();
}


#endif




