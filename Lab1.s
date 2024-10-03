.data

v1:  	.byte 2, 6, -3, 11, 9, 18, 10, 16, 5, 1
v2:  	.byte 4, 2, -13, 3, 9, 9, 7, 16, 4, 10
v3:     .space 10
flag1:  .space 1
flag2: .space 1
flag3: .space 1
.text
MAIN:
; setto entrambi a 0
daddi R1, R0 , 0 ;indice di v1
daddi R2, R0 , 0 ; indice di v2
daddi R3, R0 , 10 ; numero di elementi
daddi R7, R0 , 0 ; indice di v3
daddui R8, R0,0


LOOP1:   lb R4, v1(R1) ; in R4 ho un valore di v1
	and R2,R2,R0
	LOOP2:  lb R5,v2(R2) ; in R5 ho un valore di v2
	
	; controllo per capire se i due elementi sono uguali
	dsub R6 ,R5,R4 
	bnez R6, NOTEQUAL
	
	sb R5, v3(R7)
	daddi R7, R7, 1
	daddui R8,R0,1
	j EXIT
	
	NOTEQUAL:
	daddi R2 , R2,1
	bne R3, R2 , LOOP2
EXIT:
	daddi R1,R1,1
	bne R1,R3,LOOP1
	sb R8,flag1(R0)

ori R2, R0,1
ori R8, R0 , -1
or R6, R0,R8
LOOP3: lb R1,v3(R2)
	daddi R3,R2,-1 

	lb R4, v3(R3)
	slt R5, R4, R3 
	
	beq R6, R8, PRIMAVOLTA 
	
	bne R5,R6,EXIT2


PRIMAVOLTA:	
	daddi R2,R2,1
	or R6,R5,R0
	bne R7,R2,LOOP3
	
xori R9,R5,1
sb R9,flag2(R0)
sb R5,flag3(R0)

EXIT2:
	