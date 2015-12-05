org $00D65E
autoclean JSL hijack
NOP #6

freecode
hijack:
LDA.B #$01			; \ Play sound effect 
STA.W $1DFA			; / Jump IIRC
LDA $73
CMP #$00
BNE flip 
LDA.W $00D2BD,X			; \ Oh look, the X speed determines the "gravity"
STA $7D				; /
RTL
freecode
flip:
PHK
PEA.w .jslrtsreturn-1
PEA.w $0084CF-1
JML $00FE4A
.jslrtsreturn
LDA #$94
STA $7D
LDA $76
CMP #$00
BEQ left
BRA right
left:
LDA #$05
STA $7B
RTL
right:
LDA #$FA
STA $7B