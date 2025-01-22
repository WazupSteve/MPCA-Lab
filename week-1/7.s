@to find gcd of 2 numbers
.text
.global _start

_start:
    MOV R0, #80   @ Load 20 into R0
    MOV R1, #90  @ load 10 into R1

gcd_loop:
    CMP R0, #0     @ Compare R0 and R1
    BEQ gcd_end

    CMP R0,R1
    BLT swap
    SUB R0,R0,R1
    B gcd_loop

swap:
MOV R2,R0
MOV R0,R1
MOV R1,R2
B gcd_loop

gcd_end:
