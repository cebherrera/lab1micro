;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"dado.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ANSEL
	extern	_TRISIO
	extern	_GPIO
	extern	_CMCON0bits
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_dado_0	udata
r0x1008	res	1
r0x1009	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_dado	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;3 compiler assigned registers:
;   r0x1008
;   r0x1009
;   STK00
;; Starting pCode block
S_dado__main	code
_main:
; 2 exit points
;	.line	15; "dado.c"	TRISIO = 0b00100000; //Se ponen todos los bits como salido excpeto P5, el cual es una entrada
	MOVLW	0x20
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	16; "dado.c"	GPIO   = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	17; "dado.c"	ANSEL = 0; // Se pone el registro en 0 ya que no se utilizan señales analogicas
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	18; "dado.c"	CM0 = 1; // Se desabilita el comparador analogico 
	BANKSEL	_CMCON0bits
	BSF	_CMCON0bits,0
;	.line	19; "dado.c"	CM1 = 1; // Se desabilita el comparador analogico 
	BSF	_CMCON0bits,1
;	.line	20; "dado.c"	CM2 = 1; // Se desabilita el comparador analogico 
	BSF	_CMCON0bits,2
;	.line	23; "dado.c"	unsigned int counter = 1; 
	MOVLW	0x01
	BANKSEL	r0x1008
	MOVWF	r0x1008
	CLRF	r0x1009
_00123_DS_:
;	.line	28; "dado.c"	if (GP5 == 0){
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,5
	GOTO	_00120_DS_
;	.line	29; "dado.c"	if (counter == 1){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00106_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	30; "dado.c"	GP1 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
;	.line	31; "dado.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00106_DS_:
;	.line	33; "dado.c"	if (counter == 2){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00108_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	34; "dado.c"	GP4 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
;	.line	35; "dado.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00108_DS_:
;	.line	37; "dado.c"	if (counter == 3){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00110_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	38; "dado.c"	GP4 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
;	.line	39; "dado.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	40; "dado.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00110_DS_:
;	.line	42; "dado.c"	if (counter == 4){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00112_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00112_DS_
;	.line	43; "dado.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	44; "dado.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	45; "dado.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00112_DS_:
;	.line	47; "dado.c"	if (counter == 5){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00114_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	48; "dado.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	49; "dado.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	50; "dado.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	51; "dado.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00114_DS_:
;	.line	53; "dado.c"	if (counter == 6){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00123_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00123_DS_
;	.line	54; "dado.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	55; "dado.c"	GP4 = 1;
	BSF	_GPIObits,4
;	.line	56; "dado.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	57; "dado.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	58; "dado.c"	delay(time);
	MOVLW	0x64
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00123_DS_
_00120_DS_:
;	.line	63; "dado.c"	counter++;
	BANKSEL	r0x1008
	INCF	r0x1008,F
	BTFSC	STATUS,2
	INCF	r0x1009,F
;	.line	65; "dado.c"	GPIO = 0;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	66; "dado.c"	if (counter == 7){
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00123_DS_
	MOVF	r0x1009,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00123_DS_
;	.line	67; "dado.c"	counter = 1;
	MOVLW	0x01
	MOVWF	r0x1008
	CLRF	r0x1009
	GOTO	_00123_DS_
;	.line	71; "dado.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_dado__delay	code
_delay:
; 2 exit points
;	.line	74; "dado.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	79; "dado.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00134_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00155_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00155_DS_:
	BTFSC	STATUS,0
	GOTO	_00136_DS_
;;genSkipc:3307: created from rifx:0x7ffc342eb370
;	.line	80; "dado.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00132_DS_:
	MOVLW	0xff
	BANKSEL	r0x1004
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00132_DS_
;	.line	79; "dado.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00134_DS_
_00136_DS_:
;	.line	81; "dado.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  154+   37 =   191 instructions (  456 byte)

	end
