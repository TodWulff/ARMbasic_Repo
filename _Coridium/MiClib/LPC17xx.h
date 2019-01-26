#ifndef __LPC17xx_H
#define __LPC17xx_H

#define REG8  (volatile unsigned char*)
#define REG16 (volatile unsigned short*)
#define REG32 (volatile unsigned int*)

///* Vectored Interrupt Controller (VIC) */
#define VIC_BASE_ADDR	0xE000E000
#define VIC_VTOR   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0xD08))

#define VICIntEnable0   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x100))
#define VICIntEnable1   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x104))
#define VICIntEnClear0  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x180))
#define VICIntEnClear1  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x184))
#define VICIntSetPend0  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x200)) //nvic Irq 0-31 Set Pending
#define VICIntSetPend1  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x204)) //nvic Irq 32-63 Set Pending
#define VICIntClrPend0  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x280)) //nvic Irq 0-31 Clr Pending
#define VICIntClrPend1  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x284)) //nvic Irq 32-63 Clr Pending
//aka's
#define VICIntEnable   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x100))
#define VICIntEnClear  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x180))
#define VICIntSetPend  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x200)) //nvic Irq 0-31 Set Pending
#define VICIntClrPend  (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x280)) //nvic Irq 0-31 Clr Pending


///* The name convention below is from previous LPC2000 family MCUs, in LPC23xx, these registers are known as "VICVectPriority(x)". */
#define VICVectCntl0   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x400))
#define VICVectCntl1   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x404))
#define VICVectCntl2   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x408))
#define VICVectCntl3   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x40C))
#define VICVectCntl4   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x410))
#define VICVectCntl5   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x414))
#define VICVectCntl6   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x418))
#define VICVectCntl7   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x41C))
#define VICVectCntl8   (*(volatile unsigned long *)(VIC_BASE_ADDR + 0x420))

#define VICSTIR    (*(volatile unsigned long *)(VIC_BASE_ADDR + 0xF00))
#define VICVectAddr (*(volatile unsigned long *)(VIC_BASE_ADDR + 0xF00))

#define NVIC_FAULT_STAT_R       (*((volatile unsigned long *)0xE000ED28))
// The following are defines for the bit fields in the NVIC_FAULT_STAT register.
#define NVIC_FAULT_STAT_DIV0    0x02000000  // Divide by zero fault
#define NVIC_FAULT_STAT_UNALIGN 0x01000000  // Unaligned access fault
#define NVIC_FAULT_STAT_NOCP    0x00080000  // No coprocessor fault
#define NVIC_FAULT_STAT_INVPC   0x00040000  // Invalid PC fault
#define NVIC_FAULT_STAT_INVSTAT 0x00020000  // Invalid state fault
#define NVIC_FAULT_STAT_UNDEF   0x00010000  // Undefined instruction fault
#define NVIC_FAULT_STAT_BFARV   0x00008000  // BFAR is valid
#define NVIC_FAULT_STAT_BSTKE   0x00001000  // Stack bus fault
#define NVIC_FAULT_STAT_BUSTKE  0x00000800  // Unstack bus fault
#define NVIC_FAULT_STAT_IMPRE   0x00000400  // Imprecise data bus error
#define NVIC_FAULT_STAT_PRECISE 0x00000200  // Precise data bus error
#define NVIC_FAULT_STAT_IBUS    0x00000100  // Instruction bus fault
#define NVIC_FAULT_STAT_MMARV   0x00000080  // MMAR is valid
#define NVIC_FAULT_STAT_MSTKE   0x00000010  // Stack access violation
#define NVIC_FAULT_STAT_MUSTKE  0x00000008  // Unstack access violation
#define NVIC_FAULT_STAT_DERR    0x00000002  // Data access violation
#define NVIC_FAULT_STAT_IERR    0x00000001  // Instruction access violation


///* Pin Connect Block */
#define PINSEL_BASE_ADDR	0x4002C000
#define PCB_PINSEL0        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x00))
#define PCB_PINSEL1        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x04))
#define PCB_PINSEL2        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x08))
#define PCB_PINSEL3        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x0C))
#define PCB_PINSEL4        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x10))
#define PCB_PINSEL5        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x14))
#define PCB_PINSEL6        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x18))
#define PCB_PINSEL7        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x1C))
#define PCB_PINSEL8        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x20))
#define PCB_PINSEL9        (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x24))
#define PCB_PINSEL10       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x28))
#define PCB_PINMODE0       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x40))
#define PCB_PINMODE1       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x44))
#define PCB_PINMODE2       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x48))
#define PCB_PINMODE3       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x4C))
#define PCB_PINMODE4       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x50))
#define PCB_PINMODE5       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x54))
#define PCB_PINMODE6       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x58))
#define PCB_PINMODE7       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x5C))
#define PCB_PINMODE8       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x60))
#define PCB_PINMODE9       (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x64))

#define PCB_PINMODEOD0     (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x68))
#define PCB_PINMODEOD1     (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x6C))
#define PCB_PINMODEOD2     (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x70))
#define PCB_PINMODEOD3     (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x74))
#define PCB_PINMODEOD4     (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x78))
#define PCB_I2CPADCFG      (*(volatile unsigned long *)(PINSEL_BASE_ADDR + 0x7C))


///* General Purpose Input/Output (GPIO) */
#define GPIO_BASE_ADDR		0x40028000

/* GPIO Interrupt Registers */
#define GPIO0_INT_EN_R    (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x90)) 
#define GPIO0_INT_EN_F    (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x94))
#define GPIO0_INT_STAT_R  (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x84))
#define GPIO0_INT_STAT_F  (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x88))
#define GPIO0_INT_CLR     (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x8C))

#define GPIO2_INT_EN_R    (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0xB0)) 
#define GPIO2_INT_EN_F    (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0xB4))
#define GPIO2_INT_STAT_R  (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0xA4))
#define GPIO2_INT_STAT_F  (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0xA8))
#define GPIO2_INT_CLR     (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0xAC))

#define GPIO_INT_STAT     (*(volatile unsigned long *)(GPIO_BASE_ADDR + 0x80))


/* Fast I/O setup */
#define FIO_BASE_ADDR		0x2009C000
#define FIO0DIR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x00)) 
#define FIO0MASK       (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x10))
#define FIO0PIN        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x14))
#define FIO0SET        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x18))
#define FIO0CLR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x1C))
//aka ?
#define GPIO_IODIR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x00)) 
#define GPIO_IOMASK       (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x10))
#define GPIO_IOPIN        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x14))
#define GPIO_IOSET        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x18))
#define GPIO_IOCLR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x1C))

#define FIO1DIR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x20)) 
#define FIO1MASK       (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x30))
#define FIO1PIN        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x34))
#define FIO1SET        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x38))
#define FIO1CLR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x3C))

#define FIO2DIR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x40)) 
#define FIO2MASK       (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x50))
#define FIO2PIN        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x54))
#define FIO2SET        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x58))
#define FIO2CLR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x5C))

#define FIO3DIR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x60)) 
#define FIO3MASK       (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x70))
#define FIO3PIN        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x74))
#define FIO3SET        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x78))
#define FIO3CLR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x7C))

#define FIO4DIR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x80)) 
#define FIO4MASK       (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x90))
#define FIO4PIN        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x94))
#define FIO4SET        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x98))
#define FIO4CLR        (*(volatile unsigned long *)(FIO_BASE_ADDR + 0x9C))

/* FIOs can be accessed through WORD, HALF-WORD or BYTE. */
#define FIO0DIR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x00)) 
#define FIO1DIR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x20)) 
#define FIO2DIR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x40)) 
#define FIO3DIR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x60)) 
#define FIO4DIR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x80)) 

#define FIO0DIR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x01)) 
#define FIO1DIR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x21)) 
#define FIO2DIR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x41)) 
#define FIO3DIR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x61)) 
#define FIO4DIR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x81)) 

#define FIO0DIR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x02)) 
#define FIO1DIR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x22)) 
#define FIO2DIR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x42)) 
#define FIO3DIR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x62)) 
#define FIO4DIR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x82)) 

#define FIO0DIR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x03)) 
#define FIO1DIR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x23)) 
#define FIO2DIR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x43)) 
#define FIO3DIR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x63)) 
#define FIO4DIR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x83)) 

#define FIO0DIRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x00)) 
#define FIO1DIRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x20)) 
#define FIO2DIRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x40)) 
#define FIO3DIRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x60)) 
#define FIO4DIRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x80)) 

#define FIO0DIRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x02)) 
#define FIO1DIRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x22)) 
#define FIO2DIRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x42)) 
#define FIO3DIRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x62)) 
#define FIO4DIRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x82)) 

#define FIO0MASK0      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x10)) 
#define FIO1MASK0      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x30)) 
#define FIO2MASK0      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x50)) 
#define FIO3MASK0      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x70)) 
#define FIO4MASK0      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x90)) 

#define FIO0MASK1      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x11)) 
#define FIO1MASK1      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x21)) 
#define FIO2MASK1      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x51)) 
#define FIO3MASK1      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x71)) 
#define FIO4MASK1      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x91)) 

#define FIO0MASK2      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x12)) 
#define FIO1MASK2      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x32)) 
#define FIO2MASK2      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x52)) 
#define FIO3MASK2      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x72)) 
#define FIO4MASK2      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x92)) 

#define FIO0MASK3      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x13)) 
#define FIO1MASK3      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x33)) 
#define FIO2MASK3      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x53)) 
#define FIO3MASK3      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x73)) 
#define FIO4MASK3      (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x93)) 

#define FIO0MASKL      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x10)) 
#define FIO1MASKL      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x30)) 
#define FIO2MASKL      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x50)) 
#define FIO3MASKL      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x70)) 
#define FIO4MASKL      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x90)) 

#define FIO0MASKU      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x12)) 
#define FIO1MASKU      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x32)) 
#define FIO2MASKU      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x52)) 
#define FIO3MASKU      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x72)) 
#define FIO4MASKU      (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x92)) 

#define FIO0PIN0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x14)) 
#define FIO1PIN0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x34)) 
#define FIO2PIN0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x54)) 
#define FIO3PIN0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x74)) 
#define FIO4PIN0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x94)) 

#define FIO0PIN1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x15)) 
#define FIO1PIN1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x25)) 
#define FIO2PIN1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x55)) 
#define FIO3PIN1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x75)) 
#define FIO4PIN1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x95)) 

#define FIO0PIN2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x16)) 
#define FIO1PIN2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x36)) 
#define FIO2PIN2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x56)) 
#define FIO3PIN2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x76)) 
#define FIO4PIN2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x96)) 

#define FIO0PIN3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x17)) 
#define FIO1PIN3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x37)) 
#define FIO2PIN3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x57)) 
#define FIO3PIN3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x77)) 
#define FIO4PIN3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x97)) 

#define FIO0PINL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x14)) 
#define FIO1PINL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x34)) 
#define FIO2PINL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x54)) 
#define FIO3PINL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x74)) 
#define FIO4PINL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x94)) 

#define FIO0PINU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x16)) 
#define FIO1PINU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x36)) 
#define FIO2PINU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x56)) 
#define FIO3PINU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x76)) 
#define FIO4PINU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x96)) 

#define FIO0SET0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x18)) 
#define FIO1SET0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x38)) 
#define FIO2SET0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x58)) 
#define FIO3SET0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x78)) 
#define FIO4SET0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x98)) 

#define FIO0SET1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x19)) 
#define FIO1SET1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x29)) 
#define FIO2SET1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x59)) 
#define FIO3SET1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x79)) 
#define FIO4SET1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x99)) 

#define FIO0SET2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x1A)) 
#define FIO1SET2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x3A)) 
#define FIO2SET2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x5A)) 
#define FIO3SET2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x7A)) 
#define FIO4SET2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x9A)) 

#define FIO0SET3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x1B)) 
#define FIO1SET3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x3B)) 
#define FIO2SET3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x5B)) 
#define FIO3SET3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x7B)) 
#define FIO4SET3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x9B)) 

#define FIO0SETL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x18)) 
#define FIO1SETL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x38)) 
#define FIO2SETL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x58)) 
#define FIO3SETL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x78)) 
#define FIO4SETL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x98)) 

#define FIO0SETU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x1A)) 
#define FIO1SETU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x3A)) 
#define FIO2SETU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x5A)) 
#define FIO3SETU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x7A)) 
#define FIO4SETU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x9A)) 

#define FIO0CLR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x1C)) 
#define FIO1CLR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x3C)) 
#define FIO2CLR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x5C)) 
#define FIO3CLR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x7C)) 
#define FIO4CLR0       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x9C)) 

#define FIO0CLR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x1D)) 
#define FIO1CLR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x2D)) 
#define FIO2CLR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x5D)) 
#define FIO3CLR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x7D)) 
#define FIO4CLR1       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x9D)) 

#define FIO0CLR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x1E)) 
#define FIO1CLR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x3E)) 
#define FIO2CLR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x5E)) 
#define FIO3CLR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x7E)) 
#define FIO4CLR2       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x9E)) 

#define FIO0CLR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x1F)) 
#define FIO1CLR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x3F)) 
#define FIO2CLR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x5F)) 
#define FIO3CLR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x7F)) 
#define FIO4CLR3       (*(volatile unsigned char *)(FIO_BASE_ADDR + 0x9F)) 

#define FIO0CLRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x1C)) 
#define FIO1CLRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x3C)) 
#define FIO2CLRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x5C)) 
#define FIO3CLRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x7C)) 
#define FIO4CLRL       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x9C)) 

#define FIO0CLRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x1E)) 
#define FIO1CLRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x3E)) 
#define FIO2CLRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x5E)) 
#define FIO3CLRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x7E)) 
#define FIO4CLRU       (*(volatile unsigned short *)(FIO_BASE_ADDR + 0x9E)) 


///* System Control Block(SCB) modules include Memory Accelerator Module,
//Phase Locked Loop, VPB divider, Power Control, External Interrupt, 
//Reset, and Code Security/Debugging */
#define SCB_BASE_ADDR	0x400FC000

///* Memory Accelerator Module (MAM) */
#define MAM_CR          (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x000))
//aka, FLASHCFG includes TIM
#define SCB_FLASHCFG          (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x000))
//#define MAM_TIM         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x004))
//#define SCB_MEMMAP         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x040))

///* Phase Locked Loop (Main PLL) */
#define SCB_PLLCON         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x080))
#define SCB_PLLCFG         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x084))
#define SCB_PLLSTAT        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x088))
#define SCB_PLLFEED        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x08C))
//aka Main PLL
#define SCB_PLL0CON         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x080))
#define SCB_PLL0CFG         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x084))
#define SCB_PLL0STAT        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x088))
#define SCB_PLL0FEED        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x08C))

//USB PLL
#define SCB_PLL1CON         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x0A0))
#define SCB_PLL1CFG         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x0A4))
#define SCB_PLL1STAT        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x0A8))
#define SCB_PLL1FEED        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x0AC))


/* Clock Divider */
// #define APBDIV         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x100))
#define SCB_CCLKCFG        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x104))
#define SCB_USBCLKCFG      (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x108))
#define SCB_CLKSRCSEL      (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x10C))
#define SCB_IRCTRIM        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x1A4))
#define SCB_PCLKSEL0       (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x1A8))
#define SCB_PCLKSEL1       (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x1AC))
	
/* Power Control */
#define SCB_PCON           (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x0C0))
#define SCB_PCONP          (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x0C4))

/* Utility */
#define SCB_CLOCKOUTCFG    (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x1C8))

///* External Interrupts */
#define SCB_EXTINT         (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x140))
//#define SCB_INTWAKE        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x144))
#define SCB_EXTMODE        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x148))
#define SCB_EXTPOLAR       (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x14C))

///* Reset, reset source identification */
#define SCB_RSIR           (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x180))

///* RSID, code security protection */
//#define SCB_CSPR           (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x184))

///* AHB configuration */
//#define SCB_AHBCFG1        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x188))
//#define SCB_AHBCFG2        (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x18C))

///* System Controls and Status */
#define SCB_SCS            (*(volatile unsigned long *)(SCB_BASE_ADDR + 0x1A0))	

	
/* Timer 0 */
#define TMR0_BASE_ADDR		0x40004000
#define T0_IR           (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x00))
#define T0_TCR          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x04))
#define T0_TC           (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x08))
#define T0_PR           (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x0C))
#define T0_PC           (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x10))
#define T0_MCR          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x14))
#define T0_MR0          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x18))
#define T0_MR1          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x1C))
#define T0_MR2          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x20))
#define T0_MR3          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x24))
#define T0_CCR          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x28))
#define T0_CR0          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x2C))
#define T0_CR1          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x30))
#define T0_CR2          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x34))
#define T0_EMR          (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x3C))
#define T0_CTCR         (*(volatile unsigned long *)(TMR0_BASE_ADDR + 0x70))

/* Timer 1 */
#define TMR1_BASE_ADDR		0x40008000
#define T1_IR           (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x00))
#define T1_TCR          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x04))
#define T1_TC           (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x08))
#define T1_PR           (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x0C))
#define T1_PC           (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x10))
#define T1_MCR          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x14))
#define T1_MR0          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x18))
#define T1_MR1          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x1C))
#define T1_MR2          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x20))
#define T1_MR3          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x24))
#define T1_CCR          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x28))
#define T1_CR0          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x2C))
#define T1_CR1          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x30))
#define T1_CR2          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x34))
#define T1_EMR          (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x3C))
#define T1_CTCR         (*(volatile unsigned long *)(TMR1_BASE_ADDR + 0x70))

/* Timer 2 */
#define TMR2_BASE_ADDR		0x40090000
#define T2_IR           (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x00))
#define T2_TCR          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x04))
#define T2_TC           (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x08))
#define T2_PR           (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x0C))
#define T2_PC           (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x10))
#define T2_MCR          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x14))
#define T2_MR0          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x18))
#define T2_MR1          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x1C))
#define T2_MR2          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x20))
#define T2_MR3          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x24))
#define T2_CCR          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x28))
#define T2_CR0          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x2C))
#define T2_CR1          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x30))
#define T2_CR2          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x34))
#define T2_EMR          (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x3C))
#define T2_CTCR         (*(volatile unsigned long *)(TMR2_BASE_ADDR + 0x70))

/* Timer 3 */
#define TMR3_BASE_ADDR		0x40094000
#define T3_IR           (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x00))
#define T3_TCR          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x04))
#define T3_TC           (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x08))
#define T3_PR           (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x0C))
#define T3_PC           (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x10))
#define T3_MCR          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x14))
#define T3_MR0          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x18))
#define T3_MR1          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x1C))
#define T3_MR2          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x20))
#define T3_MR3          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x24))
#define T3_CCR          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x28))
#define T3_CR0          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x2C))
#define T3_CR1          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x30))
#define T3_CR2          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x34))
#define T3_EMR          (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x3C))
#define T3_CTCR         (*(volatile unsigned long *)(TMR3_BASE_ADDR + 0x70))

/* Repetitive Timer */
#define RI_BASE_ADDR		0x400B0000
#define RI_COMPVAL      (*(volatile unsigned long *)(RI_BASE_ADDR + 0x00))
#define RI_MASK         (*(volatile unsigned long *)(RI_BASE_ADDR + 0x04))
#define RI_CTRL         (*(volatile unsigned long *)(RI_BASE_ADDR + 0x08))
#define RI_COUNER       (*(volatile unsigned long *)(RI_BASE_ADDR + 0x0C))

/* Sys Tick Timer */
#define ST_BASE_ADDR		0xE000E000
#define ST_CTRL         (*(volatile unsigned long *)(ST_BASE_ADDR + 0x10))
#define ST_RELOAD       (*(volatile unsigned long *)(ST_BASE_ADDR + 0x14))
#define ST_CURR         (*(volatile unsigned long *)(ST_BASE_ADDR + 0x18))
#define ST_CALIB        (*(volatile unsigned long *)(ST_BASE_ADDR + 0x1C))


/* Pulse Width Modulator (PWM) */

#define PWM1_BASE_ADDR		0x40018000
#define PWM1_IR          (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x00))
#define PWM1_TCR         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x04))
#define PWM1_TC          (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x08))
#define PWM1_PR          (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x0C))
#define PWM1_PC          (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x10))
#define PWM1_MCR         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x14))
#define PWM1_MR0         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x18))
#define PWM1_MR1         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x1C))
#define PWM1_MR2         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x20))
#define PWM1_MR3         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x24))
#define PWM1_CCR         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x28))
#define PWM1_CR0         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x2C))
#define PWM1_CR1         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x30))
#define PWM1_CR2         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x34))
#define PWM1_CR3         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x38))
#define PWM1_EMR         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x3C))
#define PWM1_MR4         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x40))
#define PWM1_MR5         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x44))
#define PWM1_MR6         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x48))
#define PWM1_PCR         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x4C))
#define PWM1_LER         (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x50))
#define PWM1_CTCR        (*(volatile unsigned long *)(PWM1_BASE_ADDR + 0x70))


/* Universal Asynchronous Receiver Transmitter 0 (UART0) */
#define UART0_BASE_ADDR		0x4000C000
#define UART0_RBR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x00))
#define UART0_THR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x00))
#define UART0_DLL          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x00))
#define UART0_DLM          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x04))
#define UART0_IER          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x04))
#define UART0_IIR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x08))
#define UART0_FCR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x08))
#define UART0_LCR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x0C))
#define UART0_LSR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x14))
#define UART0_SCR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x1C))
#define UART0_ACR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x20))
#define UART0_ICR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x24))
#define UART0_FDR          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x28))
#define UART0_TER          (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x30))
#define UART0_FIFOLVL      (*(volatile unsigned long *)(UART0_BASE_ADDR + 0x58))

/* Universal Asynchronous Receiver Transmitter 1 (UART1) */
#define UART1_BASE_ADDR		0x40010000
#define UART1_RBR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x00))
#define UART1_THR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x00))
#define UART1_DLL          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x00))
#define UART1_DLM          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x04))
#define UART1_IER          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x04))
#define UART1_IIR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x08))
#define UART1_FCR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x08))
#define UART1_LCR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x0C))
#define UART1_MCR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x10))
#define UART1_LSR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x14))
#define UART1_MSR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x18))
#define UART1_SCR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x1C))
#define UART1_ACR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x20))
#define UART1_FDR          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x28))
#define UART1_TER          (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x30))
#define UART1_FIFOLVL      (*(volatile unsigned long *)(UART1_BASE_ADDR + 0x58))

/* Universal Asynchronous Receiver Transmitter 2 (UART2) */
#define UART2_BASE_ADDR		0x40098000
#define UART2_RBR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x00))
#define UART2_THR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x00))
#define UART2_DLL          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x00))
#define UART2_DLM          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x04))
#define UART2_IER          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x04))
#define UART2_IIR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x08))
#define UART2_FCR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x08))
#define UART2_LCR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x0C))
#define UART2_LSR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x14))
#define UART2_SCR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x1C))
#define UART2_ACR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x20))
#define UART2_ICR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x24))
#define UART2_FDR          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x28))
#define UART2_TER          (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x30))
#define UART2_FIFOLVL      (*(volatile unsigned long *)(UART2_BASE_ADDR + 0x58))

/* Universal Asynchronous Receiver Transmitter 3 (UART3) */
#define UART3_BASE_ADDR		0x4009C000
#define UART3_RBR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x00))
#define UART3_THR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x00))
#define UART3_DLL          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x00))
#define UART3_DLM          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x04))
#define UART3_IER          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x04))
#define UART3_IIR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x08))
#define UART3_FCR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x08))
#define UART3_LCR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x0C))
#define UART3_LSR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x14))
#define UART3_SCR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x1C))
#define UART3_ACR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x20))
#define UART3_ICR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x24))
#define UART3_FDR          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x28))
#define UART3_TER          (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x30))
#define UART3_FIFOLVL      (*(volatile unsigned long *)(UART3_BASE_ADDR + 0x58))

/* use a pointer to save space */
#define UARTX_RBR       (*(volatile unsigned long *)(UARTBASE + 0x00))
#define UARTX_THR       (*(volatile unsigned long *)(UARTBASE + 0x00))
#define UARTX_IER       (*(volatile unsigned long *)(UARTBASE + 0x04))
#define UARTX_IIR       (*(volatile unsigned long *)(UARTBASE + 0x08))
#define UARTX_FCR       (*(volatile unsigned long *)(UARTBASE + 0x08))
#define UARTX_LCR       (*(volatile unsigned long *)(UARTBASE + 0x0C))
#define UARTX_LSR       (*(volatile unsigned long *)(UARTBASE + 0x14))
#define UARTX_SCR       (*(volatile unsigned long *)(UARTBASE + 0x1C))
#define UARTX_DLL       (*(volatile unsigned long *)(UARTBASE + 0x00))
#define UARTX_DLM       (*(volatile unsigned long *)(UARTBASE + 0x04))

/* I2C Interface 0 */
#define I2C0_BASE_ADDR		0x4001C000
#define I2C_I20CONSET      (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x00))
#define I2C_I20STAT        (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x04))
#define I2C_I20DAT         (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x08))
#define I2C_I20ADR         (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x0C))
#define I2C_I20SCLH        (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x10))
#define I2C_I20SCLL        (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x14))
#define I2C_I20CONCLR      (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x18))
#define I2C_I20MMCTL       (*(volatile unsigned long *)(I2C0_BASE_ADDR + 0x1C))

/* I2C Interface 1 */
#define I2C1_BASE_ADDR		04E005C000
#define I2C_I21CONSET      (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x00))
#define I2C_I21STAT        (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x04))
#define I2C_I21DAT         (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x08))
#define I2C_I21ADR         (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x0C))
#define I2C_I21SCLH        (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x10))
#define I2C_I21SCLL        (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x14))
#define I2C_I21CONCLR      (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x18))
#define I2C_I21MMCTL       (*(volatile unsigned long *)(I2C1_BASE_ADDR + 0x1C))

/* I2C Interface 2 */
#define I2C2_BASE_ADDR		0x400A0000
#define I2C_I22CONSET      (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x00))
#define I2C_I22STAT        (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x04))
#define I2C_I22DAT         (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x08))
#define I2C_I22ADR         (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x0C))
#define I2C_I22SCLH        (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x10))
#define I2C_I22SCLL        (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x14))
#define I2C_I22CONCLR      (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x18))
#define I2C_I22MMCTL       (*(volatile unsigned long *)(I2C2_BASE_ADDR + 0x1C))

/* SPI0 (Serial Peripheral Interface 0) */
#define SPI0_BASE_ADDR		0x40020000
#define S0SPCR         (*(volatile unsigned long *)(SPI0_BASE_ADDR + 0x00))
#define S0SPSR         (*(volatile unsigned long *)(SPI0_BASE_ADDR + 0x04))
#define S0SPDR         (*(volatile unsigned long *)(SPI0_BASE_ADDR + 0x08))
#define S0SPCCR        (*(volatile unsigned long *)(SPI0_BASE_ADDR + 0x0C))
#define S0SPINT        (*(volatile unsigned long *)(SPI0_BASE_ADDR + 0x1C))

/* SSP0 Controller */
#define SSP0_BASE_ADDR		0x40088000
#define SSP0CR0        (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x00))
#define SSP0CR1        (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x04))
#define SSP0DR         (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x08))
#define SSP0SR         (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x0C))
#define SSP0CPSR       (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x10))
#define SSP0IMSC       (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x14))
#define SSP0RIS        (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x18))
#define SSP0MIS        (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x1C))
#define SSP0ICR        (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x20))
#define SSP0DMACR      (*(volatile unsigned long *)(SSP0_BASE_ADDR + 0x24))

/* SSP1 Controller */
#define SSP1_BASE_ADDR		0x40030000
#define SSP1CR0        (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x00))
#define SSP1CR1        (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x04))
#define SSP1DR         (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x08))
#define SSP1SR         (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x0C))
#define SSP1CPSR       (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x10))
#define SSP1IMSC       (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x14))
#define SSP1RIS        (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x18))
#define SSP1MIS        (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x1C))
#define SSP1ICR        (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x20))
#define SSP1DMACR      (*(volatile unsigned long *)(SSP1_BASE_ADDR + 0x24))


/* Real Time Clock */
#define RTC_BASE_ADDR		0x40024000
#define RTC_ILR            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x00))
#define RTC_CTC            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x04))
#define RTC_CCR            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x08))
#define RTC_CIIR           (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x0C))
#define RTC_AMR            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x10))
#define RTC_CTIME0         (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x14))
#define RTC_CTIME1         (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x18))
#define RTC_CTIME2         (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x1C))
#define RTC_SEC            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x20))
#define RTC_MIN            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x24))
#define RTC_HOUR           (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x28))
#define RTC_DAY            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x2C))
#define RTC_DOW            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x30))
#define RTC_DOY            (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x34))
#define RTC_MONTH          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x38))
#define RTC_YEAR           (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x3C))
#define RTC_CISS           (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x40))

#define RTC_GPREG0        (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x44))
#define RTC_GPREG1        (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x48))
#define RTC_GPREG2        (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x4C))
#define RTC_GPREG3        (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x50))
#define RTC_GPREG4        (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x54))

#define RTC_ALSEC          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x60))
#define RTC_ALMIN          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x64))
#define RTC_ALHOUR         (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x68))
#define RTC_ALDOM          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x6C))
#define RTC_ALDOW          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x70))
#define RTC_ALDOY          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x74))
#define RTC_ALMON          (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x78))
#define RTC_ALYEAR         (*(volatile unsigned long *)(RTC_BASE_ADDR + 0x7C))


/* A/D Converter 0 (AD0) */
#define AD0_BASE_ADDR		0x40034000
#define AD_ADCR          (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x00))
#define AD_ADGDR         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x04))
#define AD_ADINTEN       (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x0C))
#define AD_ADDR0         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x10))
#define AD_ADDR1         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x14))
#define AD_ADDR2         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x18))
#define AD_ADDR3         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x1C))
#define AD_ADDR4         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x20))
#define AD_ADDR5         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x24))
#define AD_ADDR6         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x28))
#define AD_ADDR7         (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x2C))
#define AD_ADSTAT        (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x30))
#define AD_ADTRIM        (*(volatile unsigned long *)(AD0_BASE_ADDR + 0x34))


/* D/A Converter */
#define DAC_BASE_ADDR		0x4008C000
#define DACR           (*(volatile unsigned long *)(DAC_BASE_ADDR + 0x00))
#define DACCTRL        (*(volatile unsigned long *)(DAC_BASE_ADDR + 0x04))
#define DACCNTVAL      (*(volatile unsigned long *)(DAC_BASE_ADDR + 0x08))


/* Watchdog */
#define WDG_BASE_ADDR		0x40000000
#define WD_WDMOD          (*(volatile unsigned long *)(WDG_BASE_ADDR + 0x00))
#define WD_WDTC           (*(volatile unsigned long *)(WDG_BASE_ADDR + 0x04))
#define WD_WDFEED         (*(volatile unsigned long *)(WDG_BASE_ADDR + 0x08))
#define WD_WDTV           (*(volatile unsigned long *)(WDG_BASE_ADDR + 0x0C))
#define WD_WDCLKSEL       (*(volatile unsigned long *)(WDG_BASE_ADDR + 0x10))


/* CAN CONTROLLERS AND ACCEPTANCE FILTER */
#define CAN_ACCEPT_BASE_ADDR		0x4003C000
#define CAN_AFMR 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x00))  	
#define CAN_SFF_SA 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x04))  	
#define CAN_SFF_GRP_SA 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x08))
#define CAN_EFF_SA 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x0C))
#define CAN_EFF_GRP_SA 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x10))  	
#define CAN_EOT 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x14))
#define CAN_LUT_ERR_ADR (*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x18))  	
#define CAN_LUT_ERR 	(*(volatile unsigned long *)(CAN_ACCEPT_BASE_ADDR + 0x1C))

#define CAN_CENTRAL_BASE_ADDR		0x40040000  	
#define CAN_TX_SR 	(*(volatile unsigned long *)(CAN_CENTRAL_BASE_ADDR + 0x00))  	
#define CAN_RX_SR 	(*(volatile unsigned long *)(CAN_CENTRAL_BASE_ADDR + 0x04))  	
#define CAN_MSR 	(*(volatile unsigned long *)(CAN_CENTRAL_BASE_ADDR + 0x08))

#define CAN1_BASE_ADDR		0x40044000
#define CAN1MOD 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x00))  	
#define CAN1CMR 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x04))  	
#define CAN1GSR 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x08))  	
#define CAN1ICR 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x0C))  	
#define CAN1IER 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x10))
#define CAN1BTR 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x14))  	
#define CAN1EWL 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x18))  	
#define CAN1SR 		(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x1C))  	
#define CAN1RFS 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x20))  	
#define CAN1RID 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x24))
#define CAN1RDA 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x28))  	
#define CAN1RDB 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x2C))
  	
#define CAN1TFI1 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x30))  	
#define CAN1TID1 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x34))  	
#define CAN1TDA1 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x38))
#define CAN1TDB1 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x3C))  	
#define CAN1TFI2 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x40))  	
#define CAN1TID2 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x44))  	
#define CAN1TDA2 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x48))  	
#define CAN1TDB2 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x4C))
#define CAN1TFI3 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x50))  	
#define CAN1TID3 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x54))  	
#define CAN1TDA3 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x58))  	
#define CAN1TDB3 	(*(volatile unsigned long *)(CAN1_BASE_ADDR + 0x5C))

#define CAN2_BASE_ADDR		0x40048000
#define CAN2MOD 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x00))  	
#define CAN2CMR 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x04))  	
#define CAN2GSR 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x08))  	
#define CAN2ICR 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x0C))  	
#define CAN2IER 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x10))
#define CAN2BTR 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x14))  	
#define CAN2EWL 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x18))  	
#define CAN2SR 		(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x1C))  	
#define CAN2RFS 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x20))  	
#define CAN2RID 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x24))
#define CAN2RDA 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x28))  	
#define CAN2RDB 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x2C))
  	
#define CAN2TFI1 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x30))  	
#define CAN2TID1 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x34))  	
#define CAN2TDA1 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x38))
#define CAN2TDB1 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x3C))  	
#define CAN2TFI2 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x40))  	
#define CAN2TID2 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x44))  	
#define CAN2TDA2 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x48))  	
#define CAN2TDB2 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x4C))
#define CAN2TFI3 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x50))  	
#define CAN2TID3 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x54))  	
#define CAN2TDA3 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x58))  	
#define CAN2TDB3 	(*(volatile unsigned long *)(CAN2_BASE_ADDR + 0x5C))


/* I2S Interface Controller (I2S) */
#define I2S_BASE_ADDR		0x400A8000
#define I2S_DAO        (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x00))
#define I2S_DAI        (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x04))
#define I2S_TX_FIFO    (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x08))
#define I2S_RX_FIFO    (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x0C))
#define I2S_STATE      (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x10))
#define I2S_DMA1       (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x14))
#define I2S_DMA2       (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x18))
#define I2S_IRQ        (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x1C))
#define I2S_TXRATE     (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x20))
#define I2S_RXRATE     (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x24))

#define I2S_TXBITRATE  (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x28))
#define I2S_RXBITRATE  (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x2C))
#define I2S_TXMODE     (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x30))
#define I2S_RXMODE     (*(volatile unsigned long *)(I2S_BASE_ADDR + 0x34))


///* USB Controller */
#define USB_INT_BASE_ADDR	0x400FC1C0
#define USB_BASE_ADDR		0x5000C200		/* USB Base Address */

#define USB_INT_STAT    (*(volatile unsigned long *)(USB_INT_BASE_ADDR + 0x00))
//GET THESE IF YOU EVER WANT TO USE USB, MAY BE CLOSE
///* USB Device Interrupt Registers */
//#define DEV_INT_STAT    (*(volatile unsigned long *)(USB_BASE_ADDR + 0x00))
//#define DEV_INT_EN      (*(volatile unsigned long *)(USB_BASE_ADDR + 0x04))
//#define DEV_INT_CLR     (*(volatile unsigned long *)(USB_BASE_ADDR + 0x08))
//#define DEV_INT_SET     (*(volatile unsigned long *)(USB_BASE_ADDR + 0x0C))
//#define DEV_INT_PRIO    (*(volatile unsigned long *)(USB_BASE_ADDR + 0x2C))

///* USB Device Endpoint Interrupt Registers */
//#define EP_INT_STAT     (*(volatile unsigned long *)(USB_BASE_ADDR + 0x30))
//#define EP_INT_EN       (*(volatile unsigned long *)(USB_BASE_ADDR + 0x34))
//#define EP_INT_CLR      (*(volatile unsigned long *)(USB_BASE_ADDR + 0x38))
//#define EP_INT_SET      (*(volatile unsigned long *)(USB_BASE_ADDR + 0x3C))
//#define EP_INT_PRIO     (*(volatile unsigned long *)(USB_BASE_ADDR + 0x40))

///* USB Device Endpoint Realization Registers */
//#define REALIZE_EP      (*(volatile unsigned long *)(USB_BASE_ADDR + 0x44))
//#define EP_INDEX        (*(volatile unsigned long *)(USB_BASE_ADDR + 0x48))
//#define MAXPACKET_SIZE  (*(volatile unsigned long *)(USB_BASE_ADDR + 0x4C))

///* USB Device Command Reagisters */
//#define USB_CMD_CODE        (*(volatile unsigned long *)(USB_BASE_ADDR + 0x10))
//#define USB_CMD_DATA        (*(volatile unsigned long *)(USB_BASE_ADDR + 0x14))

///* USB Device Data Transfer Registers */
//#define USB_RX_DATA         (*(volatile unsigned long *)(USB_BASE_ADDR + 0x18))
//#define USB_TX_DATA         (*(volatile unsigned long *)(USB_BASE_ADDR + 0x1C))
//#define USB_RX_PLENGTH      (*(volatile unsigned long *)(USB_BASE_ADDR + 0x20))
//#define USB_TX_PLENGTH      (*(volatile unsigned long *)(USB_BASE_ADDR + 0x24))
//#define USB_CTRL        (*(volatile unsigned long *)(USB_BASE_ADDR + 0x28))

///* USB Device DMA Registers */
//#define DMA_REQ_STAT        (*(volatile unsigned long *)(USB_BASE_ADDR + 0x50))
//#define DMA_REQ_CLR         (*(volatile unsigned long *)(USB_BASE_ADDR + 0x54))
//#define DMA_REQ_SET         (*(volatile unsigned long *)(USB_BASE_ADDR + 0x58))
//#define UDCA_HEAD           (*(volatile unsigned long *)(USB_BASE_ADDR + 0x80))
//#define EP_DMA_STAT         (*(volatile unsigned long *)(USB_BASE_ADDR + 0x84))
//#define EP_DMA_EN           (*(volatile unsigned long *)(USB_BASE_ADDR + 0x88))
//#define EP_DMA_DIS          (*(volatile unsigned long *)(USB_BASE_ADDR + 0x8C))
//#define DMA_INT_STAT        (*(volatile unsigned long *)(USB_BASE_ADDR + 0x90))
//#define DMA_INT_EN          (*(volatile unsigned long *)(USB_BASE_ADDR + 0x94))
//#define EOT_INT_STAT        (*(volatile unsigned long *)(USB_BASE_ADDR + 0xA0))
//#define EOT_INT_CLR         (*(volatile unsigned long *)(USB_BASE_ADDR + 0xA4))
//#define EOT_INT_SET         (*(volatile unsigned long *)(USB_BASE_ADDR + 0xA8))
//#define NDD_REQ_INT_STAT    (*(volatile unsigned long *)(USB_BASE_ADDR + 0xAC))
//#define NDD_REQ_INT_CLR     (*(volatile unsigned long *)(USB_BASE_ADDR + 0xB0))
//#define NDD_REQ_INT_SET     (*(volatile unsigned long *)(USB_BASE_ADDR + 0xB4))
//#define SYS_ERR_INT_STAT    (*(volatile unsigned long *)(USB_BASE_ADDR + 0xB8))
//#define SYS_ERR_INT_CLR     (*(volatile unsigned long *)(USB_BASE_ADDR + 0xBC))
//#define SYS_ERR_INT_SET     (*(volatile unsigned long *)(USB_BASE_ADDR + 0xC0))


///* USB Host Controller */
//#define USBHC_BASE_ADDR		0xFFE0C000
//#define HC_REVISION         (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x00))
//#define HC_CONTROL          (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x04))
//#define HC_CMD_STAT         (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x08))
//#define HC_INT_STAT         (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x0C))
//#define HC_INT_EN           (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x10))
//#define HC_INT_DIS          (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x14))
//#define HC_HCCA             (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x18))
//#define HC_PERIOD_CUR_ED    (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x1C))
//#define HC_CTRL_HEAD_ED     (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x20))
//#define HC_CTRL_CUR_ED      (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x24))
//#define HC_BULK_HEAD_ED     (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x28))
//#define HC_BULK_CUR_ED      (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x2C))
//#define HC_DONE_HEAD        (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x30))
//#define HC_FM_INTERVAL      (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x34))
//#define HC_FM_REMAINING     (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x38))
//#define HC_FM_NUMBER        (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x3C))
//#define HC_PERIOD_START     (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x40))
//#define HC_LS_THRHLD        (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x44))
//#define HC_RH_DESCA         (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x48))
//#define HC_RH_DESCB         (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x4C))
//#define HC_RH_STAT          (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x50))
//#define HC_RH_PORT_STAT1    (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x54))
//#define HC_RH_PORT_STAT2    (*(volatile unsigned long *)(USBHC_BASE_ADDR + 0x58))

///* USB OTG Controller */
//#define USBOTG_BASE_ADDR	0xFFE0C100
//#define OTG_INT_STAT        (*(volatile unsigned long *)(USBOTG_BASE_ADDR + 0x00))
//#define OTG_INT_EN          (*(volatile unsigned long *)(USBOTG_BASE_ADDR + 0x04))
//#define OTG_INT_SET         (*(volatile unsigned long *)(USBOTG_BASE_ADDR + 0x08))
//#define OTG_INT_CLR         (*(volatile unsigned long *)(USBOTG_BASE_ADDR + 0x0C))
//#define OTG_STAT_CTRL       (*(volatile unsigned long *)(USBOTG_BASE_ADDR + 0x10))
//#define OTG_TIMER           (*(volatile unsigned long *)(USBOTG_BASE_ADDR + 0x14))

//#define USBOTG_I2C_BASE_ADDR	0xFFE0C300
//#define OTG_I2C_RX          (*(volatile unsigned long *)(USBOTG_I2C_BASE_ADDR + 0x00))
//#define OTG_I2C_TX          (*(volatile unsigned long *)(USBOTG_I2C_BASE_ADDR + 0x00))
//#define OTG_I2C_STS         (*(volatile unsigned long *)(USBOTG_I2C_BASE_ADDR + 0x04))
//#define OTG_I2C_CTL         (*(volatile unsigned long *)(USBOTG_I2C_BASE_ADDR + 0x08))
//#define OTG_I2C_CLKHI       (*(volatile unsigned long *)(USBOTG_I2C_BASE_ADDR + 0x0C))
//#define OTG_I2C_CLKLO       (*(volatile unsigned long *)(USBOTG_I2C_BASE_ADDR + 0x10))

//#define USBOTG_CLK_BASE_ADDR	0xFFE0CFF0
//#define OTG_CLK_CTRL        (*(volatile unsigned long *)(USBOTG_CLK_BASE_ADDR + 0x04))
//#define OTG_CLK_STAT        (*(volatile unsigned long *)(USBOTG_CLK_BASE_ADDR + 0x08))


///* Ethernet MAC (32 bit data bus) -- all registers are RW unless indicated in parentheses */
#define MAC_BASE_ADDR		0x50000000 /* AHB Peripheral # 0 */
#define MAC_MAC1            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x000)) /* MAC config reg 1 */
#define MAC_MAC2            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x004)) /* MAC config reg 2 */
#define MAC_IPGT            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x008)) /* b2b InterPacketGap reg */
#define MAC_IPGR            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x00C)) /* non b2b InterPacketGap reg */
#define MAC_CLRT            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x010)) /* CoLlision window/ReTry reg */
#define MAC_MAXF            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x014)) /* MAXimum Frame reg */
#define MAC_SUPP            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x018)) /* PHY SUPPort reg */
#define MAC_TEST            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x01C)) /* TEST reg */
#define MAC_MCFG            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x020)) /* MII Mgmt ConFiG reg */
#define MAC_MCMD            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x024)) /* MII Mgmt CoMmanD reg */
#define MAC_MADR            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x028)) /* MII Mgmt ADdRess reg */
#define MAC_MWTD            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x02C)) /* MII Mgmt WriTe Data reg (WO) */
#define MAC_MRDD            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x030)) /* MII Mgmt ReaD Data reg (RO) */
#define MAC_MIND            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x034)) /* MII Mgmt INDicators reg (RO) */

#define MAC_SA0             (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x040)) /* Station Address 0 reg */
#define MAC_SA1             (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x044)) /* Station Address 1 reg */
#define MAC_SA2             (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x048)) /* Station Address 2 reg */

#define MAC_COMMAND         (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x100)) /* Command reg */
#define MAC_STATUS          (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x104)) /* Status reg (RO) */
#define MAC_RXDESCRIPTOR    (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x108)) /* Rx descriptor base address reg */
#define MAC_RXSTATUS        (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x10C)) /* Rx status base address reg */
#define MAC_RXDESCRIPTORNUM (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x110)) /* Rx number of descriptors reg */
#define MAC_RXPRODUCEINDEX  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x114)) /* Rx produce index reg (RO) */
#define MAC_RXCONSUMEINDEX  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x118)) /* Rx consume index reg */
#define MAC_TXDESCRIPTOR    (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x11C)) /* Tx descriptor base address reg */
#define MAC_TXSTATUS        (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x120)) /* Tx status base address reg */
#define MAC_TXDESCRIPTORNUM (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x124)) /* Tx number of descriptors reg */
#define MAC_TXPRODUCEINDEX  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x128)) /* Tx produce index reg */
#define MAC_TXCONSUMEINDEX  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x12C)) /* Tx consume index reg (RO) */

#define MAC_TSV0            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x158)) /* Tx status vector 0 reg (RO) */
#define MAC_TSV1            (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x15C)) /* Tx status vector 1 reg (RO) */
#define MAC_RSV             (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x160)) /* Rx status vector reg (RO) */

#define MAC_FLOWCONTROLCNT  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x170)) /* Flow control counter reg */
#define MAC_FLOWCONTROLSTS  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x174)) /* Flow control status reg */

#define MAC_RXFILTERCTRL    (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x200)) /* Rx filter ctrl reg */
#define MAC_RXFILTERWOLSTS  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x204)) /* Rx filter WoL status reg (RO) */
#define MAC_RXFILTERWOLCLR  (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x208)) /* Rx filter WoL clear reg (WO) */

#define MAC_HASHFILTERL     (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x210)) /* Hash filter LSBs reg */
#define MAC_HASHFILTERH     (*(volatile unsigned long *)(MAC_BASE_ADDR + 0x214)) /* Hash filter MSBs reg */

#define MAC_INTSTATUS       (*(volatile unsigned long *)(MAC_BASE_ADDR + 0xFE0)) /* Interrupt status reg (RO) */
#define MAC_INTENABLE       (*(volatile unsigned long *)(MAC_BASE_ADDR + 0xFE4)) /* Interrupt enable reg  */
#define MAC_INTCLEAR        (*(volatile unsigned long *)(MAC_BASE_ADDR + 0xFE8)) /* Interrupt clear reg (WO) */
#define MAC_INTSET          (*(volatile unsigned long *)(MAC_BASE_ADDR + 0xFEC)) /* Interrupt set reg (WO) */

#define MAC_POWERDOWN       (*(volatile unsigned long *)(MAC_BASE_ADDR + 0xFF4)) /* Power-down reg */


/* MOTOCON (sometimes referred to by the name PWM3) */
#define PWM3_BASE_ADDR 0x400B8000
#define pwm3con        *(volatile unsigned int*)(PWM3_BASE_ADDR + 0)
#define MCCON                                   (PWM3_BASE_ADDR + 0)
#define pwm3con_set    *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x4)
#define MCCON_SET                               (PWM3_BASE_ADDR + 0x4)
#define pwm3con_clr    *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x8)
#define MCCON_CLR                               (PWM3_BASE_ADDR + 0x8)
#define capturecon     *(volatile unsigned int*)(PWM3_BASE_ADDR + 0xc)
#define MCCAPCON                                (PWM3_BASE_ADDR + 0xc)
#define capturecon_set *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x10)
#define MCCAPCON_SET                            (PWM3_BASE_ADDR + 0x10)
#define capturecon_clr *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x14)
#define MCCAPCON_CLR                            (PWM3_BASE_ADDR + 0x14)
#define pwm3_tc0       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x18)
#define MCTIM0                                  (PWM3_BASE_ADDR + 0x18)
#define pwm3_tc1       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x1c)
#define MCTIM1                                  (PWM3_BASE_ADDR + 0x1c)
#define pwm3_tc2       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x20)
#define MCTIM2                                  (PWM3_BASE_ADDR + 0x20)
#define pwm3_pr0       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x24)
#define MCPER0                                  (PWM3_BASE_ADDR + 0x24)
#define pwm3_pr1       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x28)
#define MCPER1                                  (PWM3_BASE_ADDR + 0x28)
#define pwm3_pr2       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x2c)
#define MCPER2                                  (PWM3_BASE_ADDR + 0x2c)
#define pwm3_pw0       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x30)
#define MCPW0                                   (PWM3_BASE_ADDR + 0x30)
#define pwm3_pw1       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x34)
#define MCPW1                                   (PWM3_BASE_ADDR + 0x34)
#define pwm3_pw2       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x38)
#define MCPW2                                   (PWM3_BASE_ADDR + 0x38)
#define pwm3_dtr       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x3c)
#define MCDEADTIME                              (PWM3_BASE_ADDR + 0x3c)
#define curcom         *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x40)
#define MCCCP                                   (PWM3_BASE_ADDR + 0x40)
#define cap0           *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x44)
#define MCCR0                                   (PWM3_BASE_ADDR + 0x44)
#define cap1           *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x48)
#define MCCR1                                   (PWM3_BASE_ADDR + 0x48)
#define cap2           *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x4c)
#define MCCR2                                   (PWM3_BASE_ADDR + 0x4c)
#define pwm3inten        *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x50)
#define MCINTEN                                 (PWM3_BASE_ADDR + 0x50)
#define pwm3inten_set    *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x54)
#define MCINTEN_SET                             (PWM3_BASE_ADDR + 0x54)
#define pwm3inten_clr    *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x58)
#define MCINTEN_CLR                             (PWM3_BASE_ADDR + 0x58)
#define countcon       *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x5c)
#define MCCNTCON                                (PWM3_BASE_ADDR + 0x5c)
#define countcon_set   *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x60)
#define MCCNTCON_SET                            (PWM3_BASE_ADDR + 0x60)
#define countcon_clr   *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x64)
#define MCCNTCON_CLR                            (PWM3_BASE_ADDR + 0x64)
#define pwm3intflags     *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x68)
#define MCINTFLAGS                              (PWM3_BASE_ADDR + 0x68)
#define pwm3intflags_set *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x6c)
#define MCINTFLAGS_SET                          (PWM3_BASE_ADDR + 0x6c)
#define pwm3intflags_clr *(volatile unsigned int*)(PWM3_BASE_ADDR + 0x70)
#define MCINTFLAGS_CLR                          (PWM3_BASE_ADDR + 0x70)
// PWMCON reg equates
#define DCMODE   0x80000000
#define ACMODE   0x40000000
#define INVBDC   0x20000000
#define SSM2     0x00200000
#define DISUP2   0x00100000
#define PWMDTE2  0x00080000
#define POLA2    0x00040000
#define TYPE2    0x00020000
#define RUN2     0x00010000
#define SSM1     0x00002000
#define DISUP1   0x00001000
#define PWMDTE1  0x00000800
#define POLA1    0x00000400
#define TYPE1    0x00000200
#define RUN1     0x00000100
#define SSM0     0x00000020
#define DISUP0   0x00000010
#define PWMDTE0  0x00000008
#define POLA0    0x00000004
#define TYPE0    0x00000002
#define RUN0     0x00000001
// CAPTURECON reg equates
#define CAP0_CAP0R      0x00000001
#define CAP0_CAP0F      0x00000002
#define CAP0_CAP1R      0x00000004
#define CAP0_CAP1F      0x00000008
#define CAP0_CAP2R      0x00000010
#define CAP0_CAP2F      0x00000020
#define CAP1_CAP0R      0x00000040
#define CAP1_CAP0F      0x00000080
#define CAP1_CAP1R      0x00000100
#define CAP1_CAP1F      0x00000200
#define CAP1_CAP2R      0x00000400
#define CAP1_CAP2F      0x00000800
#define CAP2_CAP0R      0x00001000
#define CAP2_CAP0F      0x00002000
#define CAP2_CAP1R      0x00004000
#define CAP2_CAP1F      0x00008000
#define CAP2_CAP2R      0x00010000
#define CAP2_CAP2F      0x00020000
#define RST_TC0_ON_CAP0 0x00040000
#define RST_TC1_ON_CAP1 0x00080000
#define RST_TC2_ON_CAP2 0x00100000
#define HNFDTE0         0x00200000
#define HNFDTE1         0x00400000
#define HNFDTE2         0x00800000
// COUNTCON reg equates
#define CNT0_CAP0R 0x00000001
#define CNT0_CAP0F 0x00000002
#define CNT0_CAP1R 0x00000004
#define CNT0_CAP1F 0x00000008
#define CNT0_CAP2R 0x00000010
#define CNT0_CAP2F 0x00000020
#define CNT1_CAP0R 0x00000040
#define CNT1_CAP0F 0x00000080
#define CNT1_CAP1R 0x00000100
#define CNT1_CAP1F 0x00000200
#define CNT1_CAP2R 0x00000400
#define CNT1_CAP2F 0x00000800
#define CNT2_CAP0R 0x00001000
#define CNT2_CAP0F 0x00002000
#define CNT2_CAP1R 0x00004000
#define CNT2_CAP1F 0x00008000
#define CNT2_CAP2R 0x00010000
#define CNT2_CAP2F 0x00020000
#define COUNTMODE0 0x20000000
#define COUNTMODE1 0x40000000
#define COUNTMODE2 0x80000000
// Interrupt reg equates
#define INTENPER0 0x00000001
#define INTENPW0  0x00000002
#define INTENCAP0 0x00000004
#define INTENPER1 0x00000010
#define INTENPW1  0x00000020
#define INTENCAP1 0x00000040
#define INTENPER2 0x00000100
#define INTENPW2  0x00000200
#define INTENCAP2 0x00000400
#define INTENFES  0x00008000
#define PER0INT   0x00000001
#define PW0INT    0x00000002
#define CAP0INT   0x00000004
#define PER1INT   0x00000010
#define PW1INT    0x00000020
#define CAP1INT   0x00000040
#define PER2INT   0x00000100
#define PW2INT    0x00000200
#define CAP2INT   0x00000400
#define FESINT    0x00008000

#define CAPTURE2 0x00010000 // For pinsel3
#define CAPTURE1 0x00004000 // For pinsel3
#define CAPTURE0 0x00000100 // For pinsel3
#define PWM0A    0x00000040 // For pinsel3
#define PWM0B    0x00001000 // For pinsel3
#define PWM1A    0x00040000 // For pinsel3
#define PWM1B    0x00100000 // For pinsel3
#define PWM2A    0x01000000 // For pinsel3
#define PWM2B    0x04000000 // For pinsel3
#define FES_N    0x00000400 // For pinsel3

#define motocon_vector *(volatile unsigned int*)0x000000B8
#define motocon_interrupt 0x40000000
#define motocon_pclk_enable 0x20000

// quadrature encoder interface
#define QEI_BASE_ADDR   0x400BC000 /* APB2 Peripheral # 15 */
#define QEICON      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x000)
#define QEISTAT     *(volatile unsigned int*)(QEI_BASE_ADDR + 0x004)
#define QEICONF     *(volatile unsigned int*)(QEI_BASE_ADDR + 0x008)
#define QEIPOS      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x00C)
#define QEIMAXPOS   *(volatile unsigned int*)(QEI_BASE_ADDR + 0x010)
#define CMPOS0      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x014)
#define CMPOS1      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x018)
#define CMPOS2      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x01C)
#define INXCNT      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x020)
#define INXCMP      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x024)
#define QEILOAD     *(volatile unsigned int*)(QEI_BASE_ADDR + 0x028)
#define QEITIME     *(volatile unsigned int*)(QEI_BASE_ADDR + 0x02C)
#define QEIVEL      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x030)
#define QEICAP      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x034)
#define VELCOMP     *(volatile unsigned int*)(QEI_BASE_ADDR + 0x038)
#define FILTER      *(volatile unsigned int*)(QEI_BASE_ADDR + 0x03C)
#define QEIIEC      *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFD8)
#define QEIIES      *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFDC)
#define QEIINTSTAT  *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFE0)
#define QEIIE       *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFE4)
#define QEICLR      *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFE8)
#define QEISET      *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFEC)
#define MODID       *(volatile unsigned int*)(QEI_BASE_ADDR + 0xFFC)

#define qei_vector *(volatile unsigned int*)0x000000BC
#define qei_interrupt 0x80000000
#define qei_pclk_enable 0x40000

/* General Purpose DMA */
#define DMAC_BASE_ADDR        (0x50004000)
#define DMACIntStatus         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x000)
#define DMACIntTCStatus       *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x004)
#define DMACIntTCClr          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x008)
#define DMACIntErrStatus      *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x00C)
#define DMACIntErrClr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x010)
#define DMACRawIntTCStatus    *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x014)
#define DMACRawIntErrorStatus *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x018)
#define DMACEnbldChns         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x01C)
#define DMACSoftBReq          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x020)
#define DMACSoftSReq          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x024)
#define DMACSoftLBReq         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x028)
#define DMACSoftLSReq         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x02C)
#define DMACConfig            *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x030)
#define DMACSync              *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x034)
#define DMACC0SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x100)
#define DMACC0DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x104)
#define DMACC0LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x108)
#define DMACC0Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x10C)
#define DMACC0Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x110)
#define DMACC1SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x120)
#define DMACC1DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x124)
#define DMACC1LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x128)
#define DMACC1Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x12C)
#define DMACC1Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x130)
/* Channel 2 */
#define DMACC2SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x140)
#define DMACC2DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x144)
#define DMACC2LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x148)
#define DMACC2Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x14C)
#define DMACC2Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x150)
/* Channel 3 */
#define DMACC3SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x160)
#define DMACC3DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x164)
#define DMACC3LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x168)
#define DMACC3Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x16C)
#define DMACC3Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x170)
/* Channel 4 */
#define DMACC4SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x180)
#define DMACC4DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x184)
#define DMACC4LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x188)
#define DMACC4Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x18C)
#define DMACC4Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x190)
/* Channel 5 */
#define DMACC5SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1A0)
#define DMACC5DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1A4)
#define DMACC5LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1A8)
#define DMACC5Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1AC)
#define DMACC5Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1B0)
/* Channel 6 */
#define DMACC6SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1C0)
#define DMACC6DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1C4)
#define DMACC6LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1C8)
#define DMACC6Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1CC)
#define DMACC6Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1D0)
/* Channel 7 */
#define DMACC7SrcAddr         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1E0)
#define DMACC7DestAddr        *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1E4)
#define DMACC7LLIReg          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1E8)
#define DMACC7Control         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1EC)
#define DMACC7Config          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x1F0)

#define DMACTCR               *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x500)
#define DMACITOP1             *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x504)
#define DMACITOP2             *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x508)
#define DMACITOP3             *(volatile unsigned int*)(DMAC_BASE_ADDR + 0x50C)
#define DMACPeriphId0         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFE0)
#define DMACPeriphId1         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFE4)
#define DMACPeriphId2         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFE8)
#define DMACPeriphId3         *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFEC)
#define DMACPCellId0          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFF0)
#define DMACPCellId1          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFF4)
#define DMACPCellId2          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFF8)
#define DMACPCellId3          *(volatile unsigned int*)(DMAC_BASE_ADDR + 0xFFC)

// definitions for peripheral assignments -- bte

#define DMA_SSP0_TX    0
#define DMA_SSP0_RX    1
#define DMA_SSP1_TX    2
#define DMA_SSP1_RX    3

#define DMA_ADC        4
#define DMA_DAC        7

#define DMA_I2S0       5
#define DMA_I2S1       6

#define DMA_UART0_TX   8
#define DMA_UART0_RX   9
#define DMA_UART1_TX   10
#define DMA_UART1_RX   11
#define DMA_UART2_TX   12
#define DMA_UART2_RX   13
#define DMA_UART3_TX   14
#define DMA_UART3_RX   15

#endif  // __LPC23xx_H

