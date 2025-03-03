.segment "CODE"
.ifdef EATER
T1CL = $6004
T1CH = $6005

ACR = $600B

BEEP:
	jsr FRMEVL
	jsr MKINT

	; check if param is zero
	lda FAC+4
	ora FAC+3
	beq @silent
	
	; set T1 timer with parameter
	lda FAC+4
	sta T1CL
	lda FAC+3
	sta T1CH

	; start square wave on PB7
	lda #$c0
	sta ACR

@silent:
	jsr CHKCOM
	jsr GETBYT
	cpx #0
	beq @done

@delay1:
	ldy #$ff
@delay2:
	nop
	nop
	dey
	bne @delay2
	dex
	bne @delay1

	;stop square wave
	lda #0
	sta ACR


@done:
	rts

.endif
