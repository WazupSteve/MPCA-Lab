.data
ARRAY: .word 10,50,41,55,30,20,11,5,100,77
LOCA: .word 0,0,0,0,0,0
LOCB: .word 0,0,0,0,0,0

.text
.global _start
_start:
    LDR R0, =ARRAY      
    LDR R1, =LOCA       @Odd numbers
    LDR R2, =LOCB       @Even numbers
    MOV R3, #10         @Counter
    MOV R4, #0          @Odd index
    MOV R5, #0          @Even index
    
loop:
    LDR R6,[R0],#4
    TST R6,#1
    BEQ even
    STR R6,[R1,R4]
    ADD R4,R4,#4
    B next

even:
    STR R6,[R2,R5]
    ADD R5,R5,#4

next:
    SUBS R3,R3,#1
    BNE loop
