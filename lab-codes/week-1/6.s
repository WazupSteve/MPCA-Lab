.text
.global _start

_start:
    MOV R0, #5
    MOV R1, #1

factorial_loop:
    CMP R0, #1
    BLE factorial_end
    MUL R1, R0, R1 @ r1 = r1 * ro   
    SUB R0, R0, #1
    B factorial_loop

factorial_end:
