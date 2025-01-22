.text 
.global _start

_start:
    MOV R0, #21 @ Load 20 into R0
    AND R1, R0, #1  @ R1 = R0 & 1