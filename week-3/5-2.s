.data
    A: .word 1, 2, 3, 4, 5
    B: .word 1, 2, 3, 4, 5
    C: .word 0, 0, 0, 0, 0

.text
    MOV R10, #5          @ Number of elements in arrays A and B
    LDR R0, =A           @ Load address of array A into R0
    LDR R1, =B           @ Load address of array B into R1
    LDR R2, =C           @ Load address of array C into R2
    MOV R6, #0           @ Initialize accumulator R6 to 0

L1:
    LDR R3, [R0], #4     @ Load value from array A into R3 and increment R0 by 4
    LDR R4, [R1], #4     @ Load value from array B into R4 and increment R1 by 4
    MLA R6, R3, R4, R6   @ Multiply R3 and R4, add to R6, and store result in R6
    SUBS R10, R10, #1    @ Decrement loop counter
    BNE L1               @ If counter is not zero, branch to L1

    STR R6, [R2]         @ Store the final result in array C

    @ End of program