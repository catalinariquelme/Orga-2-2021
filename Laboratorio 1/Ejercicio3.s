.data
	#Se dereclarra un arreglo de 4 elementos
	arr: .space 16
.text
	#declaramos el indice 
	add $t0, $zero, $zero
	#Se declara a[0]
	addi $t1, $zero, 3
	sw $t1, arr($t0)
	#Se aplica operación 
	lw $t2, arr($t0)
	addi $t2, $t2, -1
	
	#El resultado se agrega a a[3]
	addi $t0, $zero, 12
	sw $t2, arr($t0) 
	
