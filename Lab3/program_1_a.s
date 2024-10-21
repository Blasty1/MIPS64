.data
v1:  .double 1.2,2.66,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 5.6,2.3,3.4,5.6,23.4,1.3,10.3,8.9

v2:  .double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 5.6,2.3,3.4,5.6,23.4,11.3,10.3,8.9

v3:  .double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 5.6,2.3,3.4,5.6,23.4,11.3,10.3,8.9
v4: .space 256 ; 32*8 , sapendo che abbiamo 32 elementi ognuno su 64 bit ( 8 byte )
v5: .space 256
v6: .space 256
m: .word 1 ; intero su 64 bit


.text 
MAIN:
ori R10,R0,248 ; indice del ciclo
ori R11,R0,1 ; indice per calcolare il multiplo 
ori R28,R0,31 ;indice i

mtc1 R0,F29 ;lo setto a 0
ld R12,m(R0) ; carico dalla memoria il valore di m

START:

; carichiamo nei registri i valori di v1,v2 e v3
l.d F1,v1(R10)
l.d F2,v2(R10)
l.d F3,v3(R10)

IF: 

bnez R11,ELSE

dsllv R13,R12,R28 ;shift logico di m di i posizioni

;trasformo m shiftato in floating point
mtc1 R13,F11
cvt.d.l F11,F11

div.d F11,F1,F11


j ENDIF

ELSE:
dmul R12,R12,R28

;trasformo R12 in floating point
mtc1 R12,F11
cvt.d.l F11,F11

mul.d F11,F1,F11


ENDIF:

bnez R11,NON_AZZERARE

ori R11,R0,4

NON_AZZERARE:

ADD.D F30,F29,F11

;lo riconverto m in intero
cvt.l.d F30,F31 
mfc1 R12,F31

; F11 è A



;calcolo v4
mul.d F7,F11,F1 ; a * v1 
sub.d F4,F7,F2
daddi R11,R11,-1



;calcolo v6
sub.d F9,F4,F1

;calcolo v5
div.d F5,F4,F3

;calcolo v6
mul.d F6,F9,F5

daddi R28,R28,-1


;store delle informazioni
s.d F4,v4(R10)
s.d F5,v5(R10)
s.d F6,v6(R10)

daddi R10,R10,-8

bnez R10,START 
;nop
HALT












HALT