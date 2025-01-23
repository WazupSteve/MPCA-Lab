.text
.global _start
_start:
    MOV R0, #21 @ Load number to check
    AND R1, R0, #1 @ R1 = R0 & 1 (remainder when divided by 2)
    MOV R2, R1 @ Move result to R2 (0 for even, 1 for odd)
