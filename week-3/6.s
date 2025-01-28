.data
    Number: .word 0x788
    Sum:    .word 0

.text
.global main
main:
    LDR R0, =Number
    LDR R1, [R0]
    MOV R2, #0
    MOV R3, #8

L1:
    AND R4, R1, #0xF
    ADD R2, R2, R4
    MOV R1, R1, LSR #4
    SUBS R3, R3, #1
    BNE L1

    LDR R0, =Sum
    STR R2, [R0]
