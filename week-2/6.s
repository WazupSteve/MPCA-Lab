.text
.global _start

_start:
    @38X72 multiplication
    @do not use MUL
    @method 1: try using 2#pow method 
    MOV R0,#38 @first number 
    MOV R1,#72 @second number
    MOV R5,R0  @store first number in R5
    MOV R0,#0  @result
    @72 = 64 + 8 ( 2^6 + 2^3)
    @38*72 = 38*64 + 38*8

    MOV R3,R5,LSL #6  @38*64
    MOV R4,R5,LSL #3  @38*8
    ADD R2,R3,R4      @final result in R2



    