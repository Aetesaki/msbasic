.segment "WOZMONEXTRA"

wozmonlcdmessage: .asciiz "Wozmon running..."

WOZMONLCD:
  jsr ECHO     ; echo \
  
  ldx #0
wozmonlcdprint:
  lda wozmonlcdmessage,x
  beq wozmonlcd_END
  jsr lcd_print_char
  inx
  jmp wozmonlcdprint
wozmonlcd_END:
  rts

WOZMONCRLF: ; Outputs LF in addition to CR
  jsr ECHO
  lda #0A
  jsr ECHO
  rts
