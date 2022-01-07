#DIVISIÓN DE DOS ENTEROS (SUBRUTINAS)
.data
	punto: .asciiz "."
	error: .asciiz "ERROR: División por cero"
	
.text
main:
	li $t0,7#Se asigna el valor del dividiendo
	li $t1,3#Se asigna el valor del divisor
	li $t9,10#Se asigna el valor del primer décimal
	li $t8,10#Se asigna el valor del segundo décimal

	beqz $t1,print#En caso de que el divisor sea igual a 0, se muestra error
	
	jal div_1#Se salta a la subrutina div_1
	
	#Imprime en la pantalla el resultado
	li $v0,1
	move $a0,$t2
	syscall
	
	#Termina la ejecución
	li $v0,10
	syscall

#Dicisión => $t2: resultado división	
div_1:
	li $t2,0#La variable temporal $t2 se usa de contador, partiendo en 0
	loop_1:
		beqz $t0,back_1#Si el resto es igual a 0 se salta a decimal_2
		blt $t0,$t1,decimal_1#Si el resto es distinto a 0 se salta a decimal_1
		sub $t0,$t0,$t1
		addi $t2,$t2,1
		b loop_1#Se regresa al loop
back_1:
	jr $ra#Salto register

#En caso de ser un divisor igual a 0	
print:
	#Imprime en la pantalla mensaje error "ERROR:División por cero"
	li $v0 4
	la $a0 error
	syscall
	
	#Termina la ejecución
	li $v0,10
	syscall

#Cálculo primer décimal	
decimal_1:
	jal mul_1#Salta a multiplicación (resto x 10)
	jal div_2#Salta a división (calcular primer décimal)
	
	#Imprime en la pantalla el resultado (1 décimal)
	li $v0,1
	move $a0,$t2
	syscall
	
	#Imprime en la pantalla punto
	li $v0,4
	la $a0 punto
	syscall
	
	#Imprime en la pantalla primer décimal
	li $v0,1
	move $a0,$t4
	syscall
	
	#Termina la ejecución
	li $v0,10
	syscall

#Resto división x 10 => $t3: resultado multipliación
mul_1:
	li $t3,0#La variable temporal $t3 se usa de contador, partiendo en 0
	
	loop_2:
		beqz $t9,back_2#En caso que la variable tempral $t9 tome el valor 0, se salta a back
		add $t3,$t3,$t0
		addi $t9,$t9,-1
		b loop_2#Se regresa al loop
	
back_2:
      	jr $ra#Salto register
      		
div_2:
	li $t4,0#La variable temporal $t4 se usa de contador, partiendo en 0
	
	loop_3:
		beqz $t3,back_3#Si la variable temporal $t3 es igual a 0 salta a back (cuociente = 1 décimal)
		blt $t3,$t1,decimal_2#Si el resto es distinto a 0 se salta a decimal_2 => división no exacta
		sub $t3,$t3,$t1
		addi $t4,$t4,1
		b loop_3#Se regresa al loop
back_3:
	jr $ra#Salto register

#Cálculo segundo décimal
decimal_2:
	jal mul_2#Salta a multiplicación (resto x 10)
	jal div_3#Salta a división (calcular segundo décimal)
	
	#Imprime en la pantalla el resultado (2 décimales)
	li $v0,1
        move $a0,$t2
        syscall
	
	#Imprime en la pantalla punto
	li $v0 4
        la $a0 punto	
	syscall
	
	#Imprime en la pantalla primer décimal
	li $v0,1
        move $a0,$t4
        syscall
        
        #Imprime en la pantalla segundo décimal
	li $v0,1
        move $a0,$t6
        syscall
	
	#Termina ejecución
	li $v0,6
	syscall	
	
mul_2:
	li $t5,0#La variable temporal $t5 se usa de contador, partiendo en 0
	
	loop_4:
		beqz $t8,back_4#En caso que la variable tempral $t8 tome el valor 0, se salta a back
		add $t5,$t5,$t3
		addi $t8,$t8,-1
		b loop_4#Se regresa al loop
	
back_4:
      	jr $ra

	
div_3:
	li $t6,0#La variable temporal $t6 se usa de contador, partiendo en 0
	
	loop_5:
		beqz $t5,back_5
		blt $t5,$t1,exit
		sub $t5,$t5,$t1
		addi $t6,$t6,1
		b loop_5#Se regresa al loop
	
back_5:
      	jr $ra
      	
exit: 	
	#Imprime resultado por pantalla
	li $v0,1
        move $a0,$t2
        syscall
	
	#Imprime en la pantalla punto
	li $v0 4
        la $a0 punto	
	syscall
	
	#Imprime en la pantalla primer décimal
	li $v0,1
        move $a0,$t4
        syscall
        
        #Imprime en la pantalla segundo décimal
	li $v0,1
        move $a0,$t6
        syscall
	
	#Termina ejecución
	li $v0,10
	syscall
	
