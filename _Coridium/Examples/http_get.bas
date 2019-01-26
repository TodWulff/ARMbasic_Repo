
#ifndef LPC2138
	#ERROR -- this exaample is only for the ARMweb
#endif

' HTTP example
' To send an HTTP GET or POST request the ARMweb must obtain its IP from a DHCP server.
' This is so the ARMweb has a DNS server or Gateway to route the request.
'
' To start a SYNC request is sent.
' ARMweb waits up to 15 seconds for a SYNC, resending the request every 5 seconds.
' Next the HTTP request is sent which waits up to 5 seconds for a response.
' The request string is built locally and can be as large as available memory.
'
' During an HTTP GET or POST request program execution is blocked.
' All TCP/IP functions are processed but the basic program will not respond.
'
' Now that the request has been successfully sent any bytes up to 256 received
' from HTTP port 80 are saved in the CGI buffer.
' This is done in the background so the program is responding normally.
' Anything more than 256 bytes is dropped.
' Headers are stripped so only page text is returned.
' 256 bytes is not enough to do much but there is not a lot of memory to spare.
'
' In the example below, after sending the request we wait up to 5 seconds for
' anything to appear in the CGI buffer.
' It is possible that CGIIN might return some data before receiving all data.
' So it might be better to delay for a time before checking CGIIN.
'
' If the basic program receives any CGI input during this process everything is messed up.
'
' Once the packet is fully received and we get a FIN flag the HTTP port is closed
' and the CGI buffer is back to operating normally.

DIM A_STRING(256)
DIM IP_ADDR as integer
DIM i as integer

' IP Address of my local web server
IP_ADDR = (192<<24) + (168<<16) + (1<<8) + 4 

i = 123 ' some value to send in CGI

' Build a request string, could also be a POST
' In this case include CGI
A_STRING = sprintf("GET /index.htm?i=%d %c%c%c%c",i,13,10,13,10)

' Example read a local page server
HTTP (IP_ADDR, A_STRING)

' it might be better to delay here for a time before checking CGIIN
'START = TIMER
'WHILE TIMER - START < 5000000
'LOOP
'A_STRING = CGIIN

' sit and listen up to 5 seconds for any incoming HTTP response
A_STRING=""
START = TIMER
WHILE A_STRING(0) = 0 and TIMER - START < 5000000
  A_STRING = CGIIN
LOOP

PRINT " read "; LEN(A_STRING); " bytes"
printf("%s", A_STRING)
 
