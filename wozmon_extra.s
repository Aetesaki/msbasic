.segment "WOZMONEXTRA"

; This file contains bug fixes and additions to wozmon

wozmonlcdmessage: .asciiz "Wozmon running..."

WOZMONLCD:
  ; Print message to LCD panel
  ; Modifies: x
  jsr ECHO     ; echo \

  phx
  ldx #0
wozmonlcdprint: ; Loop through message and print each character
  lda wozmonlcdmessage,x
  beq wozmonlcd_END
  jsr lcd_print_char
  inx
  jmp wozmonlcdprint
wozmonlcd_END:
  plx
  rts

WOZMONCRLF: ; Outputs LF in addition to CR
  jsr ECHO
  lda #0A
  jsr ECHO
  rts
