.text
.global _start

_start:
    LDR R0, =0x12345678    
    LDR R1, =0x87654321    
    LDR R2, =0x11111111   
    LDR R3, =0x22222222    

    ADDS R0, R0, R2        
    ADC  R1, R1, R3       



