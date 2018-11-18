
#include "__LIB\CompileTimeRunTimeVerbosity.lib"
#include "__lib\ab_extensions.lib"

#define Use_USART_OnChip_PeripheralDriver			' this test app is for testing the USART portions of the ROM_API_Wrapper library
' #define Use_POWER_OnChip_PeripheralDriver
' #define Use_INTDIV_OnChip_PeripheralDriver
' #define Use_I2C_OnChip_PeripheralDriver
' #define Use_SPI_OnChip_PeripheralDriver
' #define Use_ADC_OnChip_PeripheralDriver

#include "NXP_API\NXP_ROM_API_Driver_Wrapper.lib"

' consider calling in test code libs selectively based on the #defs above.

Function USART_Callback
	print "USART_Callback fired"
	return 0
	endfunction

main:
dim Callback_Pointer as integer
dim usrinput as integer

callback_pointer = addressof USART_Callback

' call init wrapper lib code herre
' or CALL(expression) to call the address representd by expression.

' trying with a flippin software reset to see if that works.

	Print "Target_ID:", "_tgtid"
	Print "Target_Name:", "_tgtnm"
	Print "Target_Memsize:",  "_tgtspecs"
	print
	Print "You've three options here:"
	print "1) Select BT's console input field press enter to run."
	Print "2) If shite be borked, press stop now, this helps to prevent bad code from making the device unrecoverable."
	Print "3) If on a manual device (i.e. 824, etc.), once you press stop, you've 5 seconds to do the Reset/OK thing, before the proggy continues."
	Print
	Print "_tgtid is waiting on user input>";
	debugin usrinput 
	print " ";usrinput
	print
	Print "Continuing in 5 seconds - you can clear the screen now, to aid in ease of copy/paste, once the code completes..."
	wait(5000)
	
	usrinput = addressof USART_Callback
	call (usrinput) ' worked
	
	print
	print i2h(__Build_UARTD_API_Func_Tbl())

	
	dim i as integer

	for i = 0 to 8
	print "UART Driver Table Entry ";i;":",i2h(uart_driver_api_func_tbl(i))
	next i
	
	print
	
	for i = uart_driver_api_func_tbl(0) to uart_driver_api_func_tbl(0)+28 step 4
	print "UART Driver Table Entry ";i2h(i);":",i2h(*(i))
	next i
' UART Driver Table Entry




end
