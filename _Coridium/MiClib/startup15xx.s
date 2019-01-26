;/**************************************************************************//**
; * @file     startup_LPC15xx.s
; * @brief    CMSIS Cortex-M3 Core Device Startup File
; *           for the NXP LPC15xx Device Series
; * @version  V1.10
; * @date     24. November 2010
; *------- <<< Use Configuration Wizard in Context Menu >>> ------------------
; *
; * @note
; * Copyright (C) 2009-2013 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M 
; * processor based microcontrollers.  This file can be freely distributed 
; * within development tools that are supporting such ARM based processors. 
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000200

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000000

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     WDT_IRQHandler            ; Watchdog timer
                DCD     BOD_IRQHandler            ; Brown Out Detect
                DCD     FLASH_IRQHandler          ; NVMC Flash Controller
                DCD     EE_IRQHandler             ; NVMC EE Controller
                DCD     DMA_IRQHandler            ; DMA Controller
                DCD     GINT0_IRQHandler                         
                DCD     GINT1_IRQHandler          ; PIO0 (0:7)   
                DCD     PIN_INT0_IRQHandler       ; All GPIO pin can be routed to PIN_INTx
                DCD     PIN_INT1_IRQHandler          
                DCD     PIN_INT2_IRQHandler                       
                DCD     PIN_INT3_IRQHandler                         
                DCD     PIN_INT4_IRQHandler                        
                DCD     PIN_INT5_IRQHandler
                DCD     PIN_INT6_IRQHandler
                DCD     PIN_INT7_IRQHandler                       
                DCD     RIT_IRQHandler            ; RIT Timer
                DCD     SCT0_IRQHandler           ; SCT Timer0
                DCD     SCT1_IRQHandler           ; SCT Timer1
                DCD     SCT2_IRQHandler           ; SCT Timer2
                DCD     SCT3_IRQHandler           ; SCT Timer3
                
                DCD     MRT_IRQHandler            ; MRT timer
                DCD     UART0_IRQHandler          ; MIN UART0
                DCD     UART1_IRQHandler          ; MIN UART1
                DCD     UART2_IRQHandler          ; MIN UART2
                DCD     I2C_IRQHandler            ; BI2C
                DCD     SPI0_IRQHandler           ; LSPI0 
                DCD     SPI1_IRQHandler           ; LSPI1 
                DCD     CAN_IRQHandler            ; CAN 
                DCD     USB_IRQHandler            ; USB IRQ
                DCD     USB_FIQHandler            ; USB FIQ
                DCD     USBWakeup_IRQHandler      ; USB wake up
                DCD     ADC0_SEQA_IRQHandler      ; ADC0 SEQA
                DCD     ADC0_SEQB_IRQHandler      ; ADC0 SEQB
                DCD     ADC0_THCMP_IRQHandler     ; ADC0 THCMP
                DCD     ADC0_OVR_IRQHandler       ; ADC0 OVR
                DCD     ADC1_SEQA_IRQHandler      ; ADC1 SEQA
                DCD     ADC1_SEQB_IRQHandler      ; ADC1 SEQB
                DCD     ADC1_THCMP_IRQHandler     ; ADC1 THCMP
                DCD     ADC1_OVR_IRQHandler       ; ADC1 OVR
                DCD     DAC_IRQHandler            ; D/A Converter
                
                DCD     COMP0_IRQHandler          ; Comparator 0
                DCD     COMP1_IRQHandler          ; Comparator 1
                DCD     COMP2_IRQHandler          ; Comparator 2
                DCD     COMP3_IRQHandler          ; Comparator 3
                DCD     QEI_IRQHandler            ; QEI 
                DCD     RTC_ALARM_IRQHandler      ; RTC Alarm 
                DCD     RTC_WAKE_IRQHandler       ; RTC Wake

                IF      :LNOT::DEF:NO_CRP
                AREA    |.ARM.__at_0x02FC|, CODE, READONLY
CRP_Key         DCD     0xFFFFFFFF
                ENDIF


                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)                

; now, under COMMON NMI.c and NMI.h, a real NMI handler is created if NMI is enabled 
; for particular peripheral.
NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
MemManage_Handler\
			    PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
			    PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
DebugMon_Handler\
			    PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
			    PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP

PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP
Reserved_IRQHandler PROC
                EXPORT  Reserved_IRQHandler       [WEAK]
                B       .
                ENDP

         
Default_Handler PROC
                EXPORT  WDT_IRQHandler            [WEAK]
                EXPORT  BOD_IRQHandler            [WEAK]
                EXPORT  FLASH_IRQHandler          [WEAK]
                EXPORT  EE_IRQHandler             [WEAK]
                EXPORT  DMA_IRQHandler            [WEAK]
                EXPORT  GINT0_IRQHandler          [WEAK]
                EXPORT  GINT1_IRQHandler          [WEAK]
                EXPORT  PIN_INT0_IRQHandler       [WEAK]
                EXPORT  PIN_INT1_IRQHandler       [WEAK]
                EXPORT  PIN_INT2_IRQHandler       [WEAK]
                EXPORT  PIN_INT3_IRQHandler       [WEAK]
                EXPORT  PIN_INT4_IRQHandler       [WEAK]
                EXPORT  PIN_INT5_IRQHandler       [WEAK]
                EXPORT  PIN_INT6_IRQHandler       [WEAK]
                EXPORT  PIN_INT7_IRQHandler       [WEAK]
                EXPORT  RIT_IRQHandler            [WEAK]
                EXPORT  SCT0_IRQHandler           [WEAK]
                EXPORT  SCT1_IRQHandler           [WEAK]
                EXPORT  SCT2_IRQHandler           [WEAK]
                EXPORT  SCT3_IRQHandler           [WEAK]

                EXPORT  MRT_IRQHandler            [WEAK]
                EXPORT  UART0_IRQHandler          [WEAK]
                EXPORT  UART1_IRQHandler          [WEAK]
                EXPORT  UART2_IRQHandler          [WEAK]
                EXPORT  I2C_IRQHandler            [WEAK]
                EXPORT  SPI0_IRQHandler           [WEAK]
                EXPORT  SPI1_IRQHandler           [WEAK]
                EXPORT  CAN_IRQHandler            [WEAK]
                EXPORT  USB_IRQHandler            [WEAK]
                EXPORT  USB_FIQHandler            [WEAK]
                EXPORT  USBWakeup_IRQHandler      [WEAK]
                EXPORT  ADC0_SEQA_IRQHandler      [WEAK]
                EXPORT  ADC0_SEQB_IRQHandler      [WEAK]
                EXPORT  ADC0_THCMP_IRQHandler     [WEAK]
                EXPORT  ADC0_OVR_IRQHandler       [WEAK]
                EXPORT  ADC1_SEQA_IRQHandler      [WEAK]
                EXPORT  ADC1_SEQB_IRQHandler      [WEAK]
                EXPORT  ADC1_THCMP_IRQHandler     [WEAK]
                EXPORT  ADC1_OVR_IRQHandler       [WEAK]
                EXPORT  DAC_IRQHandler            [WEAK]

                EXPORT  COMP0_IRQHandler          [WEAK]
                EXPORT  COMP1_IRQHandler          [WEAK]
                EXPORT  COMP2_IRQHandler          [WEAK]
                EXPORT  COMP3_IRQHandler          [WEAK]
                EXPORT  QEI_IRQHandler            [WEAK]
                EXPORT  RTC_ALARM_IRQHandler      [WEAK]
                EXPORT  RTC_WAKE_IRQHandler       [WEAK]


WDT_IRQHandler
BOD_IRQHandler
FLASH_IRQHandler
EE_IRQHandler
DMA_IRQHandler
GINT0_IRQHandler
GINT1_IRQHandler
PIN_INT0_IRQHandler
PIN_INT1_IRQHandler
PIN_INT2_IRQHandler
PIN_INT3_IRQHandler
PIN_INT4_IRQHandler
PIN_INT5_IRQHandler
PIN_INT6_IRQHandler
PIN_INT7_IRQHandler
RIT_IRQHandler
SCT0_IRQHandler
SCT1_IRQHandler
SCT2_IRQHandler
SCT3_IRQHandler

MRT_IRQHandler
UART0_IRQHandler
UART1_IRQHandler
UART2_IRQHandler
I2C_IRQHandler
SPI0_IRQHandler
SPI1_IRQHandler
CAN_IRQHandler
USB_IRQHandler
USB_FIQHandler
USBWakeup_IRQHandler
ADC0_SEQA_IRQHandler
ADC0_SEQB_IRQHandler
ADC0_THCMP_IRQHandler
ADC0_OVR_IRQHandler
ADC1_SEQA_IRQHandler
ADC1_SEQB_IRQHandler
ADC1_THCMP_IRQHandler
ADC1_OVR_IRQHandler
DAC_IRQHandler

COMP0_IRQHandler
COMP1_IRQHandler
COMP2_IRQHandler
COMP3_IRQHandler
QEI_IRQHandler
RTC_ALARM_IRQHandler
RTC_WAKE_IRQHandler

                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB
                
                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit
                
                ELSE
                
                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
