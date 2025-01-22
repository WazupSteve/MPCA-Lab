.data
Array: .word 15,10,12,13,9,45,16,8,25,33
evensum: .word 0

.text
.global _start
_start:
    LDR R0,=Array
    MOV R1,#10 @Array size
    MOV R2,#0 @Sum register

loop:
    LDR R3,[R0],#4 @using post increment mode
    TST R3,#1
    BNE skip
    ADD R2,R2,R3

skip:
    SUBS R1,R1,#1
    BNE loop

    LDR R0,=evensum
    STR R2,[R0]