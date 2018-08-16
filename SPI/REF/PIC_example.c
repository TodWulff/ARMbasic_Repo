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
 *	Specs are subject to change without any notice
 */


// PIC testing example code
// The example run out-of-the-box on uPICFAT but should run on any system
// We use UART0 through printf to print debug information
// If you are using UART with uALFAT the you have to remove all access to UART

#include "Types.h"
#include "uALFAT_lib.h"
#include <usart.h>
#include <stdio.h>
#include <SPI.h>
#include <stdlib.h>
#include <string.h>
#include "GHI_HD44780_LCD.h"

// for testing purpose only
#pragma idata gpr4
int8 buffer[256]={0};
#pragma idata


//// The debug interface baud rate ///////////////
#define BAUD_RATE 9600
#define CLOCK_FREQ    32000000
#define SPBRG_VAL   ( ((CLOCK_FREQ/BAUD_RATE)/16))


// usefull for PIC
#define ROM_TYPE (char rom near *)

#define ONE_MB_OVER_16 0x10000

//--------------------------------------------
// We will use this to test if we have somewhat accurate GHI_Sleep
void BlinkEverySecond(void)
{
	// set LED pin to output
	TRISBbits.TRISB0=0;
	while(1)
	{
		// toggle the LED
		LED0_PIN=!LED0_PIN;
		// wait for 500 ms
		GHI_Sleep(500);
	}
}
//------------------------------------------
// printf sometimes doesn't work for 32 variables, so we use our own function
void GHI_PrintNibble(int8 n)
{
	n&=0x0f;
	if(n<10)
	{
		while(BusyUSART());
		putcUSART(n+'0');
	}
	else
	{
		while(BusyUSART());
		putcUSART((n-10)+'A');
	}
}
//---------------------------------------------
void GHI_PrintDWORD(int32 dw)
{
	// send the high nibble first
	GHI_PrintNibble(dw>>28);
	GHI_PrintNibble(dw>>24);
	GHI_PrintNibble(dw>>20);
	GHI_PrintNibble(dw>>16);
	GHI_PrintNibble(dw>>12);
	GHI_PrintNibble(dw>>8);
	GHI_PrintNibble(dw>>4);
	GHI_PrintNibble(dw);
}
//---------------------------------------------
void ResetuALFATandEnterSPI(void)
{
	// at power up, SCK and SSEL must be high to 
	// make uaLFAT enter SPI mode
	// the clock is idle high so this is automatically high
	// Just make sure SPI is ready before you call this function
	
	// we need to make SSEL high
	SSEL_PIN=1;//SSEL high
	
	RESET_PIN=0;//hold uALFAT in reset state
	
	GHI_Sleep(50);//wait for 1ms
	
	RESET_PIN=1;//let uALFAT run
	GHI_Sleep(50);//wait for 1ms
	// uALFAT is running and it is in SPI mode now........
}
//---------------------------------------------
// this is not used here but for the user to see how it can be done
/*void ResetuALFATandEnterI2C(void)
{
	// on this test sysytem we have SSEL connected to RC1
	// SCK is tied to GND
	
	// set reset pin to digital and output
	// ?????????
	// set SSEL and SCK to output and digital
	// ??????
	
	// at power up, SCK must be low and SSEL must be high to 
	// make uaLFAT enter I2C mode
	
	// we need to make SSEL high and SCK low
	// ??????
	
	RESET_PIN=0;//hold uALFAT in reset state
	
	GHI_Sleep(50);//wait
	
	RESET_PIN=1;//let uALFAT run
	GHI_Sleep(50);//wait
	// uALFAT is running and it is in I2C mode now........
}*/
//---------------------------------------------
// this is not used here but for the user to see how it can be done
/*void ResetuALFATandEnterUART(void)
{
	// set reset pin to digital and output
	TRISBbits.TRISB1=0;	
	// set SSEL to output and digital
	TRISCbits.TRISC1=0;
	
	// at power up, SCK and SSEL must be low to 
	// make uaLFAT enter UART mode
	
	// we need to make SSEL and SCK low
	// ???????
	
	RESET_PIN=0;//hold uALFAT in reset state
	
	GHI_Sleep(50);//wait for 1ms
	
	RESET_PIN=1;//let uALFAT run
	GHI_Sleep(50);//wait for 1ms
	// uALFAT is running and it is in SPI mode now........
}*/
//---------------------------------------------
void SystemFail(void)
{
	while(1)
	{
		// toggle the LED
		LED0_PIN=!LED0_PIN;
		// wait for 100 ms (50 high and 50 low!)
		GHI_Sleep(50);
	}
}
//--------------------------------------------
void uALFAT_Initialize(void)
{
	int8 minor, major,c;
	
	// Close just in case!
	GHI_CloseInterface();
	
	// Lets get the interface going
	if(GHI_OpenInterface())
	{
		// this will never happen!
		printf(ROM_TYPE"Failed to open our interface\r");
		SystemFail();
	}
	printf(ROM_TYPE"Interface is ready. Resetting uALFAT\r");

	ResetuALFATandEnterSPI();

	// Exit boot loader
	printf(ROM_TYPE"trying to run uALFAT\r");

	printf(ROM_TYPE"Run the firmware.........\r\r");
	
	//GHI_Sleep(200);// wait till the firmware executes
		
	do
	{
		c=GHI_GetC();
		// show what is coming
		while(BusyUSART());
		putcUSART(c);
	}while(c!='!');
	
	// we need to remove "00/r"
	c=GHI_GetC();//0
	c=GHI_GetC();//0
	c=GHI_GetC();//\r	
	printf(ROM_TYPE"\rFirmware is running\r\r");
}
//---------------------------------------------
// This function is used to ask the user about the media type
int8 GetMediaType(void)
{
	int8 type;
	while(1)
	{
		printf(ROM_TYPE"Will the test run on a USB [U] or SD-Card [S], Cancel[C]?\r");
		while(!DataRdyUSART());
		type = getcUSART();
				
		if(type == 'U' || type == 'u')
			return GHI_InitializeUSB();
		else if(type == 'S' || type == 's')
			return GHI_InitializeSD();
		else if(type == 'C' || type == 'c')
			return ERROR_UNEXPECTED_VALUE;
		else
		{
			printf(ROM_TYPE"Wrong entry. Try again:\r");
			continue;
		}
	}
}
//----------------------------------------------
// This parses mm/dd/yyyy hh:mm:ss from USART to FAT Time Structure
// this function gets a character from USART and echo it back
void ProcessCharFromUSART(int8 *character)
{
	// get the char
	while(!DataRdyUSART());
	*character = getcUSART();
	// echo back
	while(BusyUSART());
	putcUSART(*character);
}
//----------------------------------------------
// this function echoes the input
int8 SetTimeStructure(int32 *time)
{	
	int8 buffer[5] = {0}, temp;
	int32 year, month, day, hours, minutes, seconds;
	
	
	// get month
	ProcessCharFromUSART(buffer);
	ProcessCharFromUSART(buffer + 1);
	ProcessCharFromUSART(&temp);	// we don't need this character
	if(temp != '/')
		return ERROR_UNEXPECTED_VALUE;
	month = atoi((char*)buffer);
	// get day
	ProcessCharFromUSART(buffer);
	ProcessCharFromUSART(buffer + 1);
	ProcessCharFromUSART(&temp);	// we don't need this character
	if(temp != '/')
		return ERROR_UNEXPECTED_VALUE;
	day = atoi((char*)buffer);
	// get year
	ProcessCharFromUSART(buffer);
	ProcessCharFromUSART(buffer + 1);
	ProcessCharFromUSART(buffer + 2);
	ProcessCharFromUSART(buffer + 3);
	ProcessCharFromUSART(&temp);	// we don't need this character
	if(temp != ' ')
		return ERROR_UNEXPECTED_VALUE;
	year = atoi((char*)buffer);
	//get hours
	buffer[2] = 0;
	ProcessCharFromUSART(buffer);
	ProcessCharFromUSART(buffer + 1);
	ProcessCharFromUSART(&temp);	// we don't need this character
	if(temp != ':')
		return ERROR_UNEXPECTED_VALUE;
	hours = atoi((char*)buffer);
	// get minutes
	ProcessCharFromUSART(buffer);
	ProcessCharFromUSART(buffer + 1);
	ProcessCharFromUSART(&temp);	// we don't need this character
	if(temp != ':')
		return ERROR_UNEXPECTED_VALUE;
	minutes = atoi((char*)buffer);
	// get seconds
	ProcessCharFromUSART(buffer);
	ProcessCharFromUSART(buffer + 1);
	seconds = atoi((char*)buffer);
	
	// Set the time
	*time = GetFATTimeStructure(year, month, day, hours, minutes, seconds);
	
	// done. put the '\r'
	while(BusyUSART());
	putcUSART('\r');
		
	return ERROR_NO_ERROR;
}
////////////////////////////////////////
void main(void)
{
	int8 c, bcd, var8;
	int32 var32, size;
	int8 file_name[16] = {0}, file_ext[4] = {0}, attr;

    ADCON1=0x0f;// all analog pins to digital
//    CMCON=0x07;// Shut off all comparators
	RESET_TRIS=0;// make reset pin output
	LED0_TRIS=0;// make led pin output
	LED1_TRIS=0;// make led pin output
	LED0_PIN=1;// turn LED on
	LED1_PIN=1;// turn LED on
	SSEL_TRIS=0;// make SSEL pin putput
	TRISEbits.TRISE0 = 1; // make button pin intput
	TRISEbits.TRISE1 = 1; // make button pin intput
	TRISEbits.TRISE2 = 1; // make button pin intput
	
	
	// we will get UART going because we will use it top print debug mesages
	OpenUSART(USART_TX_INT_OFF&USART_TX_INT_OFF&
	          USART_ASYNCH_MODE&USART_EIGHT_BIT&
	          USART_CONT_RX&USART_BRGH_HIGH,SPBRG_VAL);
	printf(ROM_TYPE"\fThe Debug is ready......\r");
	printf(ROM_TYPE"This library will work with firmware version 2.11 or higher\r");
	
	// test the accuracy of the GHI_Sleep functions if you like
	// this function will never return!
	// BlinkEverySecond();

	uALFAT_Initialize();
	
	///////////////////////////////////////////	
	///////// initilization is done ///////////
	///////////////////////////////////////////
	
	
	////////////////////////////
	/// Start user interface ///
	////////////////////////////
	while(1)
	{
		// Display banner on LCD
		
		LCD_Init();
		LCD_Clear();
		LCD_CursorHome();
		LCD_Putrs(ROM_TYPE"GHI Electronics");
		LCD_SetCursor(1,0);
		LCD_Putrs(ROM_TYPE"uALFAT Dev. Sys.");
		
		// Display user interface on terminal
		printf(ROM_TYPE"\f   GHI Electronics, LLC\r");
		printf(ROM_TYPE  " uALFAT Development System\r");
		printf(ROM_TYPE  "   Library Version 1.03\r");
		if(GHI_GetVersion(&c,&bcd))
		{
			printf(ROM_TYPE"Failed to get version number\r");
			SystemFail();
		}
		printf(ROM_TYPE  "   uALFAT Version %X.%02X\r",c,bcd);
		
		printf(ROM_TYPE  "---------------------------\r");
		printf(ROM_TYPE"Please select one of the options below\r\r\r");
		printf(ROM_TYPE"1. Start RS232 <-> uALFAT SPI gateway\r");
		printf(ROM_TYPE"2. Load new firmware\r");
		printf(ROM_TYPE"3. File system test\r");
		printf(ROM_TYPE"4. Write/Read performance test\r");
		printf(ROM_TYPE"5. Data logger\r");
		printf(ROM_TYPE"6. LCD test\r");
		printf(ROM_TYPE"\r>>\r");
		
		while(!DataRdyUSART());
		switch(getcUSART())
		{
			case '1':
				printf(ROM_TYPE"Gateway is enabled\r");
				while(1)
				{
					if(DataRdyUSART())
					{
						GHI_PutC(getcUSART());
					}
					if(GHI_DataIsReady())
					{
						while(BusyUSART());
						putcUSART(GHI_GetC());
					}
				}
			break;

			case '2':
				// get media type
				while(1)
				{
					printf(ROM_TYPE"Load Firmware from: 1. SD Card.\r"
								   "                    2. USB Device.\r"
								   "                    3. Cancel.\r"
								   ">>\r");
					while(!DataRdyUSART());
					c = getcUSART();
					if(c == '1')
						GHI_SendLoadFirmwareFromSDCommand();
					else if(c == '2')
						GHI_SendLoadFirmwareFromUSBCommand();
					else if(c == '3')
						break;
					else
					{
						printf(ROM_TYPE"Error Entry..\r");
						continue;
					}
					
					// loading...
					printf(ROM_TYPE"Since we are using SPI, we cannot see the data sent by the boot loader\r"
								   "*Boot Loader uses USART!!\r");
					printf(ROM_TYPE"Waiting 10 seconds for the firmware to load!\r");
					GHI_Sleep(10000);
					printf(ROM_TYPE"10 seconds passed\r"
								   "Running firmware...\r");		
					// reset uALFAT and restart the uALFAT system
					uALFAT_Initialize();
					
					break;
				}
				
				
				
			break;
			
			case '3':
			
				printf(ROM_TYPE"Running Test...\r");
				// initializing
				
				if(GetMediaType())
				{
					printf(ROM_TYPE"Failed to initialize the media\r");
					break;
				}
				
				// Creating test directories
				strcpypgm2ram((char *) file_name, ROM_TYPE"GHITEST");
				printf(ROM_TYPE"Creating Test Directory \"GHITEST\" \r");
				c = GHI_MakeDirectory(file_name);
				if(c == DIR_ENT_FOUND)
				{
					printf(ROM_TYPE"Directory already exist. Please delete it and re-try\r");
					break;
				}
				else if(c)
				{
					printf(ROM_TYPE"Could not create directory\r");
					break;
				}
				printf(ROM_TYPE"Done...\r");
				
				printf(ROM_TYPE"Creating directories inside GHITEST\r");
				if(GHI_ChangeDirectory(file_name))
				{
					printf(ROM_TYPE"Can't access GHITEST\r");
					break;
				}
				// creating DIR1, DIR2, DIR3
				strcpypgm2ram((char *)file_name, ROM_TYPE"DIR#");
				for(var32 = 1; var32 <= 3; var32++)
				{
					file_name[3] = var32 + '0';
					printf(ROM_TYPE"%s", file_name);
					if(GHI_MakeDirectory(file_name))
					{
						printf(ROM_TYPE" ,Cannot be created.\r");
						break;
					}
					printf(ROM_TYPE" ,Created succesfully.\r");
				}
				// Creating file.txt using handle #0
				printf(ROM_TYPE"Creating file.txt inside GHITEST\r");
				strcpypgm2ram((char *)file_name, ROM_TYPE"FILE.TXT");
				if(GHI_OpenFile(0, file_name, 'W'))
				{
					printf(ROM_TYPE"Cannot create file\r");
					break;
				}
				printf(ROM_TYPE"Writing 6 Bytes to the file...\r");
				// send write command
				if(GHI_SendWriteCommand(0, 6))
				{
					printf(ROM_TYPE"Cannot write to the file\r");
					break;
				}
				// send 6 bytes
				for(c = 0; c < 6; c++)
				{
					GHI_PutC(c + '0');
				}
				// check write results
				if(GHI_GetReadAndWriteResult(&var32))
				{
					printf(ROM_TYPE"Error writing to the file\r");
					break;
				}
				GHI_PrintDWORD(var32);
				printf(ROM_TYPE" bytes were successfully written to the file.\r");
				// Close file and reopen for reaing
				printf(ROM_TYPE"Reading data from %s\r", file_name);
				if(GHI_CloseFile(0))
				{
					printf(ROM_TYPE"Cannot close file after writing..\r");
					break;
				}
				if(GHI_OpenFile(0, file_name, 'R'))
				{
					printf(ROM_TYPE"Cannot open the file...\r");
					break;
				}
				// read 8 bytes
				printf(ROM_TYPE"Reading 8 bytes using * as a filler\r");
				if(GHI_SendReadCommand(0 ,8, '*'))
				{
					printf(ROM_TYPE"Cannot write to the file.\r");
					break;
				}
				// read data
				for(c = 0; c < 8; c++)
				{
					while(BusyUSART());
					putcUSART(GHI_GetC());
				}
				while(BusyUSART());
				putcUSART('\r');
				// get read results
				if(GHI_GetReadAndWriteResult(&var32))
				{
					printf(ROM_TYPE"Error reading from the file\r");
					break;
				}
				GHI_PrintDWORD(var32);
				printf(ROM_TYPE" bytes were successfully read from the file.\r");
				if(GHI_CloseFile(0))
				{
					printf(ROM_TYPE"Cannot close the file.\r");
					break;
				}
				
				// enumerate files
				printf(ROM_TYPE"Listing Files:\r");
				if(GHI_InitGetFile())
				{
					printf(ROM_TYPE"Cannot Get files list\r");
					break;
				}
				var32 = 0;
				while(1)
				{
					var32 = GHI_GetNextFile(file_name, file_ext, &attr, &size);
					if(var32 == ERROR_END_OF_DIR_LIST)
					{
						break;
					}
					if(var32)	// error
					{
						printf(ROM_TYPE"Error Getting files list\r");
						break;
					}
					
					printf(ROM_TYPE"\r%s.%s  %02X  ", file_name, file_ext, attr);
					GHI_PrintDWORD(size);
				}
				if(var32 != ERROR_END_OF_DIR_LIST)	// error
				{
					printf(ROM_TYPE"Error in lising files.\r");
					break;
				}
				printf(ROM_TYPE"\rTest done.\r"
							   "Press any key to continue.\r");
				while(!DataRdyUSART());
				getcUSART();
				
				break;
				/////////////////////////////////////////////////////////////////	
				
			case '4':
			
				printf(ROM_TYPE"Running Test...\r"
							   "Reading/writing one MB of data takes an average of 18 seconds.\r"
							   "However, on low-end media this might take considerabley longer time!\r");
				// initializing
				
				if(GetMediaType())
				{
					printf(ROM_TYPE"Failed to initialize the media\r");
					break;
				}
				
				
				// writing 1 MB to a file
				printf(ROM_TYPE"* 1. Writing 1MB of data to a file *\r"
							   "Opening file ONEMB.TXT\r");
				strcpypgm2ram((char*)file_name, ROM_TYPE"ONEMB.TXT");
				if(c = GHI_OpenFile(0, file_name,'W'))
				{
					printf(ROM_TYPE"Could not open file\r");
					break;
				}
				printf(ROM_TYPE"Writing...\rPlease wait... \r");
				
				
				size = 0;	// size of data written
				var8=0;// initialize the percentage counter
				for(c = 0; c < 16; c++)		// repeat 16 times
				{
					// working indicator
					printf(ROM_TYPE"%d%% ",var8+=6);
					
					// write first ONE_MB_OVER_16
					if(GHI_SendWriteCommand(0, ONE_MB_OVER_16))
					{
						printf(ROM_TYPE"Cannot write to the file\r");
						break;
					}
					for(var32 = 0; var32 < ONE_MB_OVER_16; var32++)
					{
						GHI_PutC('X');
					}
					if(GHI_GetReadAndWriteResult(&var32))
					{
						printf(ROM_TYPE"Error Writing to file\r");
						break;
					}
					// add how many bytes we successfully written
					size += var32;
					
				}
				printf(ROM_TYPE"\rDone...\r");
				GHI_PrintDWORD(size);
				printf(ROM_TYPE" bytes of data were written successfully\r");
				GHI_CloseFile(0);
				
				// Reading 1MB
				printf(ROM_TYPE"\r\r* 2. Reading 1MB of data from a file *\r"
							   "Opening file ONEMB.TXT\r");
				if(c = GHI_OpenFile(0, file_name,'R'))
				{
					printf(ROM_TYPE"Could not open file\r");
					break;
				}
				printf(ROM_TYPE"Reading...\r"
							   "Please wait... \r");
				
				size = 0;	// size of data read
				var8=0;// initialize the percentage counter
				for(c = 0; c < 16; c++)		// repeat 16 times
				{
					// working indicator
					printf(ROM_TYPE"%d%% ",var8+=6);
					
					// read first ONE_MB_OVER_16
					if(GHI_SendReadCommand(0, ONE_MB_OVER_16, '*'))
					{
						printf(ROM_TYPE"Cannot read from the file\r");
						break;
					}
					for(var32 = 0; var32 < ONE_MB_OVER_16; var32++)
					{
						GHI_GetC();
					}
					if(GHI_GetReadAndWriteResult(&var32))
					{
						printf(ROM_TYPE"Error reading from file\r");
						break;
					}
					// add how many bytes we successfully read
					size += var32;
				}
				printf(ROM_TYPE"\rDone...\r");
				GHI_PrintDWORD(size);			   
				printf(ROM_TYPE" bytes were read succussfully.\r");
				GHI_CloseFile(0);
				
				printf(ROM_TYPE"\rTest done.\r"
							   "Press any key to continue.\r");
				while(!DataRdyUSART());
				getcUSART();
				
				break;
				
				////////////////////////////////////////////////////////////////
				
			case '5':
				
				printf(ROM_TYPE"Running Test...\r");
				// initializing
				
				if(GetMediaType())
				{
					printf(ROM_TYPE"Failed to initialize the media\r");
					break;
				}
				///////////
				// Initialize time
				while(1)
				{
					printf(ROM_TYPE"Is a 32 khz crystal and a back-up battery connected?[Y,N]\r");
					while(!DataRdyUSART());
					var8 = getcUSART();
					if(var8 == 'y' || var8 == 'Y')
					{
						c = GHI_InitTime(1);
						break;
					}
					else if(var8 == 'n' || var8 == 'N')
					{
							c = GHI_InitTime(0);
							break;
					}
					else
					{
						printf(ROM_TYPE"Wrong entry. Try again.\r");
						continue;
					}
				}
				if(c)	// error
				{
					printf(ROM_TYPE"Error initializing time.\r");
					break;
				}
				// ask the user for the time
				printf(ROM_TYPE"Enter the time in the following format :\r"
							   "mm/dd/yyyy hh:mm:ss\r");
				// fill in the structure from user
				if(SetTimeStructure(&var32))
				{
					printf(ROM_TYPE"Error parsing time structure\r");
					break;
				}
				// send it to uALFAT
				if(GHI_SetTime(var32))
				{
					printf(ROM_TYPE"Could not set the time\r");
					break;
				}
				// open log.txt
				strcpypgm2ram((char*)file_name, ROM_TYPE"LOG.TXT");
				if(GHI_OpenFile(0, file_name, 'W'))
				{
					printf(ROM_TYPE"Cannot open %s\r", file_name);
					break;
				}
				printf(ROM_TYPE"LOG.TXT is created.\r"
							   "This file stores the time and date at which S2, S3 buttons\r"
							   "are pressed. press S4 button to exit and display the log!!\r");
				var8 = 1;	// a flag to note an error
				while(var8)
				{
					if(PORTEbits.RE0 || PORTEbits.RE1)		// if a button is pressed
					{
						var8 = PORTE & 0x3; // store the button
						// wait till the button releases
						while(PORTE & 0x3);
						if(var8 == 1)
						{
							printf(ROM_TYPE"Button S2 is pressed\r");
							strcpypgm2ram((char*)buffer, ROM_TYPE"S2 is pressed on ");
						}
						if(var8 == 2)
						{
							printf(ROM_TYPE"Button S3 is pressed\r");
							strcpypgm2ram((char*)buffer, ROM_TYPE"S3 is pressed on ");
						}
						// read the time at the end of buffer
						var32 = strlen((char*)buffer);
						if(GHI_GetFormattedTime(buffer + var32))
						{
							printf(ROM_TYPE"Could not process time\r");
							break;
						}
						// append "\r\n"
						size = strlen((char*)buffer);
						buffer[size] = '\r';
						buffer[size + 1] = '\n';
						size += 2;
						// write it
						if(GHI_WriteFile(0, buffer, size, &var32))
						{
							printf(ROM_TYPE"Could not write to the log\r");
							break;
						}
						if(var32 != size)	// not all the buffer was written
						{
							printf(ROM_TYPE"Error writing to buffer\r");
							break;
						}
					}
					if(PORTEbits.RE2)
					{
						if(GHI_CloseFile(0))
						{
							printf(ROM_TYPE"Cannot close %s\r", file_name);
							break;
						}
						printf(ROM_TYPE"Log created succussfully\r"
									   "Displaying LOG.TXT\r");
						// read log
						if(GHI_OpenFile(0, file_name, 'R'))
						{
							printf(ROM_TYPE"Cannnot open %s\r", file_name);
							break;
						}
						while(1)
						{
							if(GHI_ReadFile(0, buffer, 1, '*', &var32))
							{
								printf(ROM_TYPE"Error reading from log\r");
								var8 = 0;	// set an error to the outer loop
								break;
							}
							if(var32 == 0)	// Can't read any more, Done
							{
								printf(ROM_TYPE"Done. Press any key to continue...\r");
								while(!DataRdyUSART());
								getcUSART();
								// close file
								if(GHI_CloseFile(0))
								{
									printf(ROM_TYPE"Cannot close the log file\r");
									var8 = 0;	// set an error to the outer loop
									break;
								}
								var8 = 0;	// set an error to the outer loop
								break;
							}
							// print it
							while(BusyUSART());
							putcUSART(*buffer);
						}
						
					}
				}
				
				
				////////////////////////
				
			break;
			
			case '6':
			
			printf(ROM_TYPE"Running test...\r");
			// initialze LCD
			LCD_Init();
			LCD_Clear();
			LCD_CursorHome();
			//
			
			LCD_Putrs(ROM_TYPE"uALFAT ROCKS!!!"); 		// print something
			
			printf(ROM_TYPE"Press S2 button to move the text to the left.\r"
						   "Press S4 button to move the text to the right.\r"
						   "Press S3 button to exit.\r");
			while(1)
			{
				if(PORTEbits.RE0)	// s2 is pressed , move left
				{
					while(PORTEbits.RE0);	// wait till the button releases
					LCD_ScrollLeft();	
				}
				else if(PORTEbits.RE2)	// s4 is pressed, move right
				{
					while(PORTEbits.RE2);	// wait till the button releases
					LCD_ScrollRight();
				}
				else if(PORTEbits.RE1)	// s3 is pressed, exit!
				{
					break;
				}
			}
			
			// Done.
			printf(ROM_TYPE"Test done. Press any key to continue...\r");
			while(!DataRdyUSART());
			getcUSART();
						
			break;
			
			///////////////////////

			default:
				printf(ROM_TYPE"Unknown entry!\r");
		}
		
		printf(ROM_TYPE"2 seconds delay ..");
		GHI_Sleep(500);
		printf(ROM_TYPE".");
		GHI_Sleep(500);
		printf(ROM_TYPE".");
		GHI_Sleep(500);
		printf(ROM_TYPE".");
		GHI_Sleep(500);
	
	}		
}

