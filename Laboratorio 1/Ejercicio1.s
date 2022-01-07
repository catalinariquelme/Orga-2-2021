.data
.text
	#Se asigna 20 a $t0 (x) | 20
	addi $t0, $zero, 20
	#Se asigna 5 a $t1 (y) | x + 5
	addi $t1, $t0, 5
	#Se asigna 4 a $t3 | x +4
	addi $t3, $t0, 4
	#Se asigna -9 a $t4 | y-9
	addi $t4, $t1, -9 
	#Se asignan los valores | (x+4)-(y-9)
	sub $t2, $t3, $t4 
	
