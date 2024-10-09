.data
v1:  .double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 5.6,2.3,3.4,5.6,23.4,11.3

v2:  .double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 5.6,2.3,3.4,5.6,23.4,11.3

v3:  .double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 1.2,2.2,3.2,4.4,5.0,6.1,1.2,2.2,3.2,4.4,5.0,6.1
	.double 5.6,2.3,3.4,5.6,23.4,11.3
v4: .space 256 ; 32*8 , sapendo che abbiamo 32 elementi ognuno su 64 bit ( 8 byte )
v5: .space 256
v6: .space 256

.text 
MAIN:
ori R10,R0,256  ; indice del ciclo
START:
daddi R10,R10,-8

; carichiamo nei registri i valori di v1,v2 e v3
l.d F1,v1(R10)
l.d F2,v2(R10)
l.d F3,v3(R10)

;calcolo v4
mul.d F7,F1,F1 ; v1 * v1 
sub.d F4,F7,F2
s.d F4,v4(R10)

;calcolo v5
div.d F8,F4,F3
sub.d F5,F8,F2
s.d F5,v5(R10)

;calcolo v6
sub.d F9,F4,F1
mul.d F6,F9,F5
s.d F6,v6(R10)

bnez R10,START  












HALT