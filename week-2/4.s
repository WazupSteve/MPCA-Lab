.data
A: .WORD 10,50,41,55,30,20,11,5,100,77

.text
.global _start
_start:
    LDR R0,=A @load A
    MOV R1,#10 @count
    MOV R3,#0 @greatest element

L1:
    LDR R2,[R0],#4
    SUB R1,R1,#1
    CMP R3,R2
    BLT L2
    CMP R1,#0
    BNE L1
    BEQ L3
    
L2: 
    MOV R3,R2
    CMP R1,#0
    BNE L1
    BEQ L3
        
L3: 
    SWI 0X11

