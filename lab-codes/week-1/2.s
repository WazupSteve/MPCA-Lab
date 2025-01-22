.section .text
.global _start

_start:
    MOV R0, #-7    @ Load -1 into R0
    RSB R1, R0, #0 @ R1 = 0 - R0