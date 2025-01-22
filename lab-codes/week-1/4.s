.text
    .global _start

_start:
    MOV R0, #20    @ Load 20 into R0
    MOV R1, #10    @ load 10 into R1

    CMP R0, R1     @ Compare R0 and R1
    BEQ subtract
        ADD R2,R0,R1 @ R2 = R0 + R1
        B end

    subtract: 
        SUB R2,R0,R1 @ R2 = R0 - R1
    
    end:
