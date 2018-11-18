#include "SPI.bas"
'dim InStr(50) as string
dim OutStr(50) as string

#define SPI_CS		8
#define SPI_Clk		9
#define SPI_MOSI	13
#define SPI_MISO	14


outstr="0123456789"
output(12)
do
out(12)=1
SPIOUT (SPI_CS, SPI_Clk, SPI_MOSI, 0, 10, outstr)
out(12)=0
waitmicro(25)
loop

