.data
    expression: .asciz "56+23+-" @postfix expression
    stack: .space 100 @space for stack

.text
.global _start

_start:
    ldr r1, =expression @load expression address
    ldr r2, =stack @load stack   
    mov r3, #0 @Stack pointer

process_char:
    ldrb r4, [r1], #1 @load and process the character -> then increment
    cmp r4, #0 @check for null terminator
    beq done @ if null we are done

    @check if the character is digit (0-9)
    cmp r4, #'0'
    blt check_operator
    cmp r4, #'9'
    bgt check_operator

    @Handle digit
    sub r4, r4, #'0'         @convert ASCI to character
    str r4, [r2, r3, lsl #2] @store in stack
    add r3, r3, #1           @increment stack pointer
    b process_char

check_operator:
    @ Check for + operator
    cmp r4, #'+'
    beq add_op
    
    @ Check for - operator
    cmp r4, #'-'
    beq sub_op
    b process_char

add_op:
    @ Pop two operands
    sub r3, r3, #1           @ Decrement stack pointer
    ldr r5, [r2, r3, lsl #2] @ Get second operand
    sub r3, r3, #1
    ldr r6, [r2, r3, lsl #2] @ Get first operand
    
    @ Perform addition
    add r7, r6, r5
    
    @ Push result
    str r7, [r2, r3, lsl #2] @ Store result
    add r3, r3, #1           @ Increment stack pointer
    b process_char

sub_op:
    @ Pop two operands
    sub r3, r3, #1           @ Decrement stack pointer
    ldr r5, [r2, r3, lsl #2] @ Get second operand
    sub r3, r3, #1
    ldr r6, [r2, r3, lsl #2] @ Get first operand
    
    @ Perform subtraction
    sub r7, r6, r5
    
    @ Push result
    str r7, [r2, r3, lsl #2] @ Store result
    add r3, r3, #1           @ Increment stack pointer
    b process_char

done:
    @ Result is on top of stack
    sub r3, r3, #1
    ldr r0, [r2, r3, lsl #2] @ Load final result into r0

    @ Exit program
    mov r7, #1               @ Exit syscall
    swi 0