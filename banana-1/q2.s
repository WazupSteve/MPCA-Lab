.DATA
A: .WORD 5,4,3,2,1    @ Array to be sorted
N: .WORD 5            @ Size of array

.TEXT
    LDR R0, =A        @ Load array address
    LDR R4, =N        @ Load address of N
    LDR R4, [R4]      @ R4 contains N
    SUB R4, R4, #1   @ R4 = N-1 (for outer loop)
    MOV R1, #0        @ i = 0 (outer loop counter)

ILOOP:
    CMP R1, R4        @ Compare i with N-1
    BGE EXIT          @ If i >= N-1, exit
    MOV R2, #0        @ j = 0 (inner loop counter)
    SUB R3, R4, R1    @ R3 = N-1-i (inner loop bound)

JLOOP:
    CMP R2, R3        @ Compare j with N-1-i
    BGE ILOOP_END     @ If j >= N-1-i, end inner loop
    
    @ Load elements for comparison
    MOV R5, R2, LSL #2    @ R5 = j * 4 (offset for first element)
    ADD R5, R0, R5    @ R5 = address of A[j]
    LDR R6, [R5]      @ R6 = A[j]
    LDR R7, [R5, #4]  @ R7 = A[j+1]
    
    @ Compare and swap if needed
    CMP R6, R7        @ Compare A[j] and A[j+1]
    BLE NO_SWAP       @ If A[j] <= A[j+1], dont swap
    
    @ Swap elements
    STR R7, [R5]      @ A[j] = R7
    STR R6, [R5, #4]  @ A[j+1] = R6

NO_SWAP:
    ADD R2, R2, #1    @ j++
    B JLOOP           @ Continue inner loop

ILOOP_END:
    ADD R1, R1, #1    @ i++
    B ILOOP           @ Continue outer loop

EXIT:
    @ Program end