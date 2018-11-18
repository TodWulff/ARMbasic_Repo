/* Copyright (c) 2006, GHI Electronics, LLC
 * All rights reserved. 
 *
 * You can use this file if you agree to the following
 *
 * 1. This header can't be changed under any condition
 *    
 * 2. This is free software and therefore is providede with NO warranty 
 * 
 * 3. Feel free to modify the codes but we ask you to provide us with 
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

// no matter what processor you use, you shouldn't need to change this file
// if you need ot make chanegs, make a speperate file.
// This makes it easier for you to get future updates of the library

#include "uALFAT_lib.h"

//---------------------------------------------
int8 ASCIItoNibble(int8 digit)
{
	if ( digit<='9' )
    {
        return(digit-'0');
    }else if (digit>='A'&& digit<='F')
    {
        return((digit-'A')+10);
    }else
    {
        if(digit>='a' && digit<='f')
        {
            return((digit-'a')+10);
        }
    }
    return 0;
}
//---------------------------------------------
int32 HEXstrToDouble(int8 str[])
{
    int32 result;
    int8 i;

    result=0;
    i=0;
    while(str[i])
    {
        result=result<<4;
        if( ((str[i]>='0')&&(str[i]<='9')) )
          result=result | (str[i]-'0');
        if( ((str[i]>='A')&&(str[i]<='F'))  )
          result=result | ((str[i]-'A')+10);
        i++;
    }
    return result;
}
//---------------------------------------------
void GHI_PutNibble(int8 n)
{
	n&=0x0f;
	if(n<10)
		GHI_PutC(n+'0');
	else
		GHI_PutC((n-10)+'A');
}
//---------------------------------------------
void GHI_PutDWORD(int32 dw)
{
	// send the high nibble first
	GHI_PutNibble(dw>>28);
	GHI_PutNibble(dw>>24);
	GHI_PutNibble(dw>>20);
	GHI_PutNibble(dw>>16);
	GHI_PutNibble(dw>>12);
	GHI_PutNibble(dw>>8);
	GHI_PutNibble(dw>>4);
	GHI_PutNibble(dw);
}
//---------------------------------------------
void GHI_PutWORD(int16 w)
{
	// send the high nibble first
	GHI_PutNibble(w>>12);
	GHI_PutNibble(w>>8);
	GHI_PutNibble(w>>4);
	GHI_PutNibble(w);
}
//---------------------------------------------
// the return data is always in this format
// !zz<CR>
int8 GHI_GetResult(void)
{
	int8 result;
	int8 c;

	c=GHI_GetC();
	if( c=='!')// the command has returned the results
	{
		result=ASCIItoNibble(GHI_GetC())<<4;
		result|=ASCIItoNibble(GHI_GetC());
		if(GHI_GetC()!='\r') // data MUST end with <CR>
			return ERROR_UNEXPECTED_VALUE;
		// everything went well
		return result;
	}
	
	return ERROR_UNEXPECTED_VALUE;
}
//---------------------------------------------
int8 GHI_InitializeSD(void)
{
	GHI_PutC('I');
	GHI_PutC('\r');
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_InitializeUSB(void)
{
	GHI_PutC('U');
	GHI_PutC('\r');
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_ChangeDirectory(int8 * filename)
{
	GHI_PutC('A');
	GHI_PutC(' ');
	GHI_PutS(filename);
	GHI_PutC('\r');
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_MakeDirectory(int8 * filename)
{
	GHI_PutC('M');
	GHI_PutC(' ');
	GHI_PutS(filename);
	GHI_PutC('\r');
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_OpenFile(int8 filehandle,int8 *filename, int8 openmode)
{
	GHI_PutC('O');
	GHI_PutC(' ');
	GHI_PutNibble(filehandle);
	GHI_PutC(openmode);
	GHI_PutC('>');
	GHI_PutS(filename);
	GHI_PutC('\r');
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_SendReadCommand(int8 filehandle,int32 datasize, int8 filler)
{
	GHI_PutC('R');
	GHI_PutC(' ');
	GHI_PutNibble(filehandle);
	GHI_PutC(filler);
	GHI_PutC('>');
	GHI_PutDWORD(datasize);
	GHI_PutC('\r');

	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_GetReadAndWriteResult(int32 * actualdatasize)
{
	int8 datastring[9];
	int8 c;

	if(GHI_GetC()!='$')
		return ERROR_UNEXPECTED_VALUE;

	for(c=0;c<8;c++)
		datastring[c]=GHI_GetC();
	datastring[8]=0;//terminate with null
	*actualdatasize=HEXstrToDouble(datastring);
	
	if(GHI_GetC()!='\r')
		return ERROR_UNEXPECTED_VALUE;
	

	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_SendWriteCommand( int8 filehandle,int32 desireddatasize )
{
	GHI_PutC('W');
	GHI_PutC(' ');
	GHI_PutNibble(filehandle);
	GHI_PutC('>');
	GHI_PutDWORD(desireddatasize);
	GHI_PutC('\r');

	return GHI_GetResult();
	
}
//---------------------------------------------
int8 GHI_CloseFile(int8 filehandle)
{
	
	GHI_PutC('C');
	GHI_PutC(' ');
	GHI_PutNibble(filehandle);
	GHI_PutC('\r');

	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_GetVersion(int8* major,int8 * BCDminor)
{
	int8 c;
	
	GHI_PutC('V');
	GHI_PutC('\r');
	// lets double check 2 of the characters (uALFAT x.xx
	if(GHI_GetC()!='u')
		return ERROR_UNEXPECTED_VALUE;
	if(GHI_GetC()!='A')
		return ERROR_UNEXPECTED_VALUE;

	// dump the rest of the string USBizi
	c=GHI_GetC();//L
	c=GHI_GetC();//F
	c=GHI_GetC();//A
	c=GHI_GetC();//T
	c=GHI_GetC();// space

	*major = ASCIItoNibble(GHI_GetC());
	c=GHI_GetC();//dot
	*BCDminor = ASCIItoNibble(GHI_GetC());
	*BCDminor <<=4;
	*BCDminor |= ASCIItoNibble(GHI_GetC());
	c=GHI_GetC();//cariage return
	
	//GHI_Sleep(1);	
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_SeekFile(int8 filehandle, int32 newposition)
{
	GHI_PutC('P');
	GHI_PutC(' ');
	GHI_PutNibble(filehandle);
	GHI_PutC('>');
	GHI_PutDWORD(newposition);
	GHI_PutC('\r');

	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_DeleteFile(int8 * filename)
{
	GHI_PutC('D');
	GHI_PutC(' ');
	GHI_PutS(filename);
	GHI_PutC('\r');

	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_FlushFile(int8 filehandle)
{
	GHI_PutC('F');
	GHI_PutC(' ');
	GHI_PutNibble(filehandle);
	GHI_PutC('\r');

	return GHI_GetResult();
}
//---------------------------------------------
void GHI_StartMediStatistics(void)
{
	GHI_PutC('K');
	GHI_PutC('\r');
}
//---------------------------------------------
int8 GHI_GetResultsMediaStatistics(int32 * size ,int32 * free)
{
	int8 c;
	int8 temp[9];
	
	c=GHI_GetResult();
	if(c)
	{
		// the command failed
		return c;
	}
	// the command passed
	if(GHI_GetC()!='$')
		return ERROR_UNEXPECTED_VALUE;
	for(c=0;c<8;c++)
		temp[c]=GHI_GetC();
	temp[8]=0;//terminate
	*size=HEXstrToDouble(temp);
	
	if(GHI_GetC()!=' ')
		return ERROR_UNEXPECTED_VALUE;
	
	if(GHI_GetC()!='$')
		return ERROR_UNEXPECTED_VALUE;
	for(c=0;c<8;c++)
		temp[c]=GHI_GetC();
	temp[8]=0;//terminate
	*free=HEXstrToDouble(temp);
	
	if(GHI_GetC()!='\r')
		return ERROR_UNEXPECTED_VALUE;
	
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_uALFATPowerMode(int8 mode, int16 baud)
{
	if(mode== 'F' || mode == 'R' )
	{
		GHI_PutC('Z');
		GHI_PutC(' ');
		GHI_PutC(mode);
		GHI_PutC('>');
		GHI_PutWORD(baud);
		GHI_PutC('\r');
		return GHI_GetResult();
	}
	return ERROR_UNEXPECTED_VALUE;
}
//---------------------------------------------
void GHI_uALFATHibernate(void)
{
	GHI_PutC('Z');
	GHI_PutC(' ');
	GHI_PutC('H');
	GHI_PutC('\r');
}
//---------------------------------------------
int8 GHI_uALFATWake(void)
{
	GHI_ToggleWakePin();
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_GetFileInfo(int8 * filename, int32 * size, int8 * attributes, int32 *date_time)
{
	int8 temp[9];
	int8 c;
	
	GHI_PutC('?');
	GHI_PutC(' ');
	GHI_PutS(filename);
	GHI_PutC('\r');
	c=GHI_GetResult();
	if(c)
	{
		// error code
		return c;
	}
	// the command passed
	if(GHI_GetC()!='$')
		return ERROR_UNEXPECTED_VALUE;
	for(c=0;c<8;c++)
		temp[c]=GHI_GetC();
	temp[8]=0;//terminate
	*size=HEXstrToDouble(temp);
	
	if(GHI_GetC()!=' ')
		return ERROR_UNEXPECTED_VALUE;
	
	if(GHI_GetC()!='$')
		return ERROR_UNEXPECTED_VALUE;
	for(c=0;c<2;c++)// we got 2 bytes only
		temp[c]=GHI_GetC();
	temp[2]=0;//terminate
	*attributes=HEXstrToDouble(temp);// our function is smart enough to get just a byte back
	
	if(GHI_GetC()!=' ')	return ERROR_UNEXPECTED_VALUE;
	if(GHI_GetC()!='$')	return ERROR_UNEXPECTED_VALUE;
	
	for(c=0;c<8;c++)// we got 8 bytes only
		temp[c]=GHI_GetC();
	temp[8]=0;//terminate
	
	*date_time=HEXstrToDouble(temp);
	
	if(GHI_GetC()!='\r')
		return ERROR_UNEXPECTED_VALUE;
	
	return GHI_GetResult();
	
}
//---------------------------------------------
int8 GHI_InitTime(int8 backup)
{
	GHI_PutC('T');
	GHI_PutC(' ');
	if(backup)
		GHI_PutC('B');
	else
		GHI_PutC('S');
	GHI_PutC('\r');
	
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_SetTime(int32 time)
{
	GHI_PutC('S');
	GHI_PutC(' ');
	GHI_PutDWORD(time);
	GHI_PutC('\r');
	
	return GHI_GetResult();
}
//---------------------------------------------
int8 GHI_GetFormattedTime(int8 *buffer)
{
	int8 index;
	
	GHI_PutC('G');
	GHI_PutC(' ');
	GHI_PutC('F');
	GHI_PutC('\r');
	
	index = GHI_GetResult();		// check for error
	if(index)		// error
	{
		return index;
	}
	
	// check if the command passed
	buffer[2] = 0;		// mm'/'
	buffer[0] = GHI_GetC();
	buffer[1] = GHI_GetC();
	buffer[2] = GHI_GetC();
	if(buffer[2] != '/')
		return ERROR_UNEXPECTED_VALUE;
	
	// get the rest
	index = 3;
	while(1)
	{
		buffer[index] = GHI_GetC();
		if(buffer[index] == '\r')
		{
			buffer[index] = 0;	// make it null terminated
			return GHI_GetResult();
		}
		index++;
	}
}
#ifdef _USE_READWRITE_WRAPERS_
int8 GHI_ReadFile(int8 handle, int8 *buffer, int32 size, int8 filler, int32 *actualdatasize)
{
	int32 var32;
	if(var32 = GHI_SendReadCommand(handle, size, filler))
		return var32;
	
	for(var32 = 0; var32 < size; var32++)
	{
		*buffer++ = GHI_GetC();
	}
	
	return GHI_GetReadAndWriteResult(actualdatasize);
}
//---------------------------------------------------
int8 GHI_WriteFile(int8 handle, int8 *buffer, int32 size, int32 *actualdatasize)
{
	int32 var;
	if(var = GHI_SendWriteCommand(handle, size))
		return var;
	
	for(var = 0; var < size; var++)
	{
		GHI_PutC(buffer[var]);
	}
	
	
	return GHI_GetReadAndWriteResult(actualdatasize);
}
#endif
//-------------------------------------------------
12/31/2005 - 23:59:58