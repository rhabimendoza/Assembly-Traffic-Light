;----------------------------------------------------------------
	list		p=16f877A	
	#include	<p16f877A.inc>
	__CONFIG _CP_OFF & _PWRTE_ON & _WDT_OFF & _XT_OSC
;----------------------------------------------------------------
	
	
	
;----------------------------------------------------------------	
    STATUS EQU 03H
    PORTC EQU 07H
    PORTD EQU 08H
    TEMP1 EQU 0CH
    TEMP2 EQU 0DH
    TEMP3 EQU 0EH
;----------------------------------------------------------------
 
	
 
;----------------------------------------------------------------
	ORG 0x00
	    GOTO MAIN
	ORG 0x04
	    RETFIE
;----------------------------------------------------------------	   



;----------------------------------------------------------------
MAIN
	    
	BSF	STATUS, 5	; Set STATUS bit 5
	CLRF	PORTC		; Clear PORTC
	CLRF	PORTD		; Clear PORTD
	BCF	STATUS, 5	; Clear STATUS bit 5
;----------------------------------------------------------------
	
	
	
;----------------------------------------------------------------	
LOOPING
	
	MOVLW	B'00000001'	; Light up Red
	MOVWF	PORTC
	MOVLW	B'10000000'	; Light up Green
	MOVWF	PORTD
	
	; Delay for 5 sec
	CALL	DELAY1S				
	CALL	DELAY1S				
	CALL	DELAY1S	
	CALL	DELAY1S	
	CALL	DELAY1S	
	
	MOVLW	B'00000011'	; Light up Red and Amber
	MOVWF	PORTC
	MOVLW	B'01000000'	; Light up Amber
	MOVWF	PORTD
	
	; Delay for 2 sec
	CALL	DELAY1S	
	CALL	DELAY1S	
	
	MOVLW	B'00000100'	; Light up Green
	MOVWF	PORTC
	MOVLW	B'00100000'	; Light up Red
	MOVWF	PORTD
	
	; Delay for 5 sec
	CALL	DELAY1S	
	CALL	DELAY1S	
	CALL	DELAY1S	
	CALL	DELAY1S	
	CALL	DELAY1S	
	
	MOVLW	B'00000010'	; Light up Amber
	MOVWF	PORTC
	MOVLW	B'01100000'	; Light up Red and Amber
	MOVWF	PORTD
	
	; Delay for 2 sec
	CALL	DELAY1S	
	CALL	DELAY1S	

	GOTO LOOPING		; Repeat
;----------------------------------------------------------------

	
	
;----------------------------------------------------------------
; 1 second delay setup
DELAY1S
    MOVLW 0X05
    MOVWF TEMP1
    MOVLW 0X1F
    MOVWF TEMP2
    MOVLW 0X03
    MOVWF TEMP3
DELAY1SLOOP
    DECFSZ TEMP1, F
    GOTO NEXT_DELAY1SLOOP_1
    DECFSZ TEMP2, F
    GOTO NEXT_DELAY1SLOOP_2
    DECFSZ TEMP3, F
    GOTO DELAY1SLOOP
    GOTO END_DELAY1SLOOP
NEXT_DELAY1SLOOP_1
    GOTO NEXT_DELAY1SLOOP_2
    GOTO NEXT_DELAY1SLOOP_2
NEXT_DELAY1SLOOP_2
    GOTO DELAY1SLOOP
END_DELAY1SLOOP
    RETURN
;----------------------------------------------------------------


    
END