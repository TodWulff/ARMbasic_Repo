/*
 * Copyright (c) 2006, GHI Electronics, LLC
 * All rights reserved. 
 *
 * You can use this file if you agree to the following
 *
 * 1. This header can't be changed under any condition
 *    
 * 2. This is free software and therefore is providede with NO warranty 
 * 
 * 3. Fell free to modify the codes but we ask you to provide us with 
 *	  any bugs reports so we can keep the code up to date
 *
 * 4. This code may ONLY be used with GHI Electronics, LLC products
 *
 * THIS SOFTWARE IS PROVIDED BY GHI ELECTRONICS, LLC ``AS IS'' AND 
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
 * A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL 
 * GHI ELECTRONICS, LLC BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON 
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR ORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.  
 *
 * Specs are subject to change without any notice
 */

#include "GHI_inter_PIC_SPI.h"
#include "types.h"
#ifdef _USE_GHI_INTR_PIC_SPI_

#include <SPI.h>


// we need a local FIFO to hold the incoming data
#pragma idata gpr3
int8 rx_fifo[256]={0};
#pragma idata
int8 rx_fifo_in=0;
int8 rx_fifo_out=0;

//----------------------------------------------------------------------------

//------------------------------------------
void GHI_ToggleWakePin(void)
{
}
//------------------------------------------
void GHI_Sleep(int16 ms)
{
	// this is fine for out PIC runing on 32 Mhz
	// you will have to change this loop according to your speed
	int32 x,z;
	for(z=0;z<ms;z++)
		for(x=0;x<500;x++);
}
//------------------------------------------
int8 GHI_OpenInterface(void)
{
	OpenSPI(SPI_FOSC_4, MODE_11, SMPEND);
	
	//make SSEL output
	SSEL_TRIS=0;
	
	// reset the fifo
	rx_fifo_in=0;
	rx_fifo_out=0;
	
 	return NO_ERROR;
}
//------------------------------------------
int8 GHI_CloseInterface(void)
{
	CloseSPI();
}
//------------------------------------------
int8 GHI_SetBaudRate(int32 baud)
{
	// not needed for SPI
	return UNKNOWN_ERROR;
}
//------------------------------------------
// delay at least 0.5us (500ns)
#define SPI_Delay() Nop();Nop();Nop();
//------------------------------------------
// we added this to do processing on the recieved tokens
// This is only needed in the case of SPI
int8 ProcessRX(int8 rx)
{
	static int8 got_hdt=0;
	switch(rx)
  	{
	  	case HDT:
	  		if(got_hdt)
	  		{
		  		rx_fifo[rx_fifo_in++]= 0xfe;
		  		got_hdt=0;
		  	}else
		  		got_hdt=1;
	  	break;
	  	case NDT:
	  		// we will always ignore this
	  	break;
	  	default:
	  		if(got_hdt)
	  		{
		  		rx_fifo[rx_fifo_in++]= 0xff;
		  		got_hdt=0;
		  	}else
		  		rx_fifo[rx_fifo_in++]= rx;
	}
	return got_hdt;
}
//------------------------------------------
int8 GHI_GetC(void)
{
	int8 c;


	
	
	while(!GHI_DataIsReady());

	if(DATARDY_PIN)// are we going to get somethign new?
	{
	// we will get 0xff sometimes but this is not data
	// DATARDY is high; therefore, there is real data to come
	// we still have one problem! HDT (0xFE) can come and in this case
	// we have to read a second byte to know the real value
	do
	{
		do
		{
			SSEL_PIN=0;
			
			SPI_Delay();
			
			SSPBUF = NDT;// NDT is 0xFF
			while ( !SSPSTATbits.BF );
			SSEL_PIN=1;
			c=SSPBUF;
		}while(c==0xff);
		
		
		// if process returns true then state machine is awaiting
		// another char before pushing new data into fifo. 
		}while(ProcessRX(c));
		
	}
	// return what we have
	return rx_fifo[rx_fifo_out++];
}
//------------------------------------------
void GHI_PutC(int8 ch)
{
	while(BUSY_PIN)
		Nop();
	if( ch==NDT)
	{
		// we need to send HDT first
		SSEL_PIN=0;
		SPI_Delay();
		SSPBUF = HDT;
		while ( !SSPSTATbits.BF );
		ProcessRX(SSPBUF);
		SSEL_PIN=1;
		ch=0;// now we send 0 to indicate 0xFF
	}else if(ch==HDT)
	{
		// we need to send HDT first
		SSEL_PIN=0;
		SPI_Delay();
		SSPBUF = HDT;
		while ( !SSPSTATbits.BF );
		ProcessRX(SSPBUF);
		SSEL_PIN=1;
		// we will send HDT a second time to indicate 0xFE
	}
	SSEL_PIN=0;
	SPI_Delay();
	SSPBUF = ch;
	while ( !SSPSTATbits.BF );
	ProcessRX(SSPBUF);
	SSEL_PIN=1;
}
//------------------------------------------
void GHI_PutS(int8 * str)
{
	int8 c;
	
	c=0;
	while(str[c])	
		GHI_PutC(str[c++]);
		
}
//------------------------------------------
int8 GHI_DataIsReady(void)
{
	if(rx_fifo_out!=rx_fifo_in)
		return 1; // we got data in fifo
	if(DATARDY_PIN)
		return 1; // we got data 
	return 0;// no data is ready
}
//------------------------------------------
#endif
