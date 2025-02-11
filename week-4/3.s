.DATA
A: .WORD 0x124
.TEXT
      LDR R0,=A        ; Load address of A
      LDR R0,[R0]      ; Load value 0x124 into R0
      MOV R1,#0x00F    ; Mask for extracting digits
      MOV R3,#0        ; Counter
      MOV R4,#1        ; Start with 16^0
      MOV R6,#0        ; Initialize sum to 0
LOOP: AND R2,R1,R0     ; Extract digit
      MUL R5,R2,R4     ; Multiply digit by power of 16
      ADD R6,R6,R5     ; Add to running sum
      MOV R0,R0,LSR#4  ; Shift right to get next digit
      MOV R4,R4,LSL#4  ; Multiply power by 16 (shift left 4)
      ADD R3,R3,#1     ; Increment counter
      CMP R3,#3        ; Check if we've processed 3 digits
      BLT LOOP         ; If not, continue loop
      SWI 0x11         ; Software interrupt to exit