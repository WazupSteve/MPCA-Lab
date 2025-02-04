.data
A: .byte 1,2,3,4,5,6,7,8,9,10

.text
MOV R0,#10
LDR R1,=A
LOOP:
    LDRB R2,[R1],#1
    ADD R3,R3,R2
    SUBS R0,R0,#1
    BNE LOOP

    SWI 0x11;
