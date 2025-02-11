.DATA
A:.WORD 1,2,3,4,5,6,7,8,9 
.TEXT
    LDR R0,=A        ; Load base address
    MOV R1,#2        ; x coordinate
    MOV R2,#2        ; y coordinate
    MOV R3,#3        ; number of rows
    MOV R6,#4        ; word size (4 bytes)
    MLA R4,R2,R3,R1  ; Calculate index (y*rows + x)
    MLA R5,R4,R6,R0  ; Calculate final address (base + index*4)
    LDR R7,[R5]      ; Load value at calculated address
    SWI 0x11