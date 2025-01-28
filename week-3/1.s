.data
A: .word 10 
B: .word 3 

.global _start
_start:
    MOV r0, #10          
    MOV r1, #3         
    MOV r3, #0          

loop:
    SUBS r2, r0, r1      
    BLT exit             
    MOV r0, r2           
    B loop               
exit:
    CMP r2, r1           
    ADDLT r3, r3, r1     
    BX lr             

