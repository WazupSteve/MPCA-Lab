.data 
    A: .hword 1,2,3,4,5,6,7,8,9

.text
    LDR R1,=A
    LDR R0, [R1]  ; Initially, set first element as the largest element (stored in register R0). 

    MOV R3, #0   ; Count Register

LOOP:    
    LDR R2, [R1, #4]!   ; load the next element 
    CMP R0, R2          ; compare 
    BLT Less            ; if the previous element is less than next element then store the largest element in register R0.
L1:  
    ADD R3, R3, #1
    CMP R3, #4
    BNE LOOP
    B EXIT

Less:   
    MOV R0, R2             
    B L1
EXIT:   
    SWI 0X011
