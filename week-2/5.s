.text
.global _start

_start:
    MOV R0,#3 @the number to check
    MOV R1,#0 @ counter
    MOV R2,#32 @ Bit counter

loop:
    TST R0,#1 
    ADDNE R1,R1,#1 @executes when result of prev operation is non zero
    MOV R0, R0,LSR #1
    SUBS R2,R2,#1
    BNE loop @looping untill counter is 0

    @we check parity here
    TST R1,#1
    MOVEQ R3,#1
    MOVNE R3,#0 




