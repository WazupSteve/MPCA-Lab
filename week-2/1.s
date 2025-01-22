.text
.global _start

_start:
    MOV R0, #16
    MOV R1, #25
    MOV R2, #0

    @25 = 16 + 8 + 1
    @ Ans = 16*16 + 16*8 +16*1
    MOV R3, R0,LSL #4
    MOV R4, R0,LSL #3
    ADD R2,R3,R4
    ADD R2,R2,R0



