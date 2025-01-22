.section .text
.global _start
_start:
    @perform not operation only using mov and bitwise logical
    MOV R1, #0xFFFFFFFF    ; Load all 1's
    @ assumed R0 is loaded with 0  
    LDR R0, =0x99999999   ; Load some random value
    EOR R2, R0, R1
