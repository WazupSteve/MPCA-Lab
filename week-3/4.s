.data
A: .word 1,2,3,4,5,6,7,8,9

.text
LDR R0,=A        @ Load base address of array A
MOV R9,#4        @ Size of each element (4 bytes)
MOV R1,#2        @ Column number (0-based)
MOV R2,#2        @ Row number (0-based)
MOV R3,#3        @ Number of columns in matrix

MLA R4,R2,R3,R1  @ R4 = (row * num_columns) + col
                 @ R4 now contains the index

@ Calculate address
MUL R5,R4,R9     @ R5 = index * 4
ADD R6,R0,R5     @ R6 = base_address + offset

@ Now:
@ R4 contains the index of the element
@ R6 contains the memory address of the element
