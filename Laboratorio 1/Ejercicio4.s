.data
.text
	main:
	#Se asigna a a $t6
	addi $t6, $zero, 2
	#Se asigna b a $t7
	addi $t7, $zero, 10
	#Se asigna m a $t0
	addi $t0, $zero, 0
	j While

	#Label While
	While:
		blez $t6, Exit
		add $t0, $t0 , $t7
		addi $t6, $t6, -1
		j While

	#Label Exit
	Exit:
		addi $v0, $zero, 10
		Syscall 

