.DATA
A: .WORD 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
.TEXT
LDR R0,=A;
MOV R1,#0; i
MOV R2,#0; j
MOV R3,#1; COUNT    ; This register isn't needed
MOV R4,#0; Digit 0
MOV R5,#5; Digit 5

LOOP1: CMP R1,#4
       BGE END      ; Changed from BLT to BGE and branch to END
       MOV R2,#0    ; Moved this up and removed redundant instruction
       
LOOP2: CMP R2,#4
       BGE NEXT_ROW ; Changed from BGT to BGE and branch to NEXT_ROW
       CMP R1,R2
       BEQ TEQ
       STR R4,[R0],#4
       ADD R2,R2,#1
       B LOOP2
       
TEQ:  STR R5,[R0],#4
      ADD R2,R2,#1  ; Added this instruction
      B LOOP2       ; Added branch back to LOOP2

NEXT_ROW:           ; Added new label
      ADD R1,R1,#1
      B LOOP1

END:               ; Added END label