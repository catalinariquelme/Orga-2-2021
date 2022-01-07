.data
	arr: .word 10 22 15 40
	end:
.text
	main:
		addi $s2, $zero, 2 #Se establece una constante para divir
		la $s0, arr
		la $s1, end
		subu $s1, $s1, $s0
		srl $s1, $s1, 2
		add $t3, $zero, $s1
		j For
	
	For:
		blez $t3, Exit #En el caso que el contador llegue 0, finaliza
		lw $t0, 0($s0) 
		div $t0, $s2
		mfhi $s4 
		addi $t3, $t3, -1
		addi $s0, $s0, 4
		beqz $s4, If 
		j For
	
	If:
		add $t1, $t1, $t0
		j For
		
	Exit:
		addi $v0, $zero, 1
		Syscall

