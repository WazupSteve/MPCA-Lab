.DATA
 A: .word 10
 B: .word 11

.TEXT
LDR R0,=A;
LDR R1,=B;
LDR R2,[R0];
LDR R3,[R1];

L1: CMP R2,R3;
	BLT L2;
	SUB R2,R2,R3;
	B L1;
	
L2: SWI 0x011;