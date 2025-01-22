.text
.global _start_128
_start_128:
    LDR R0, =0x11111111   
    LDR R1, =0x22222222
    LDR R2, =0x33333333
    LDR R3, =0x44444444    
    
    LDR R4, =0x55555555    
    LDR R5, =0x66666666
    LDR R6, =0x77777777
    LDR R7, =0x88888888    

    ADDS R0, R0, R4       
    ADCS R1, R1, R5        
    ADCS R2, R2, R6        
    ADC  R3, R3, R7        

