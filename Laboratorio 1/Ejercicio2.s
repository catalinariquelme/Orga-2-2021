.data
.text
	
    li $t3,-1 #Se asigna x a $t3
    li $t4,1 #Se asigna y a $t4
    add $t0,$t3,$t4 #Operación para calcular z 
    
    #operacion condicional if
    li $t1,0           
    li $t2,1           
    beq $t0,$t1,if #If z == 0
    beq $t0,$t2,elseif #Elseif z == 1
    li $t4,100 #Else
    
    #Finaliza
    li $v0,10
    syscall
    
    #En el caso que se cumpla if
    if:
       addi $t4,$t4,1
       li $v0,10
       syscall
       
    #En el caso que se cumpla elseif
    elseif:
       sub $t4,$t4,1
       li $v0,10
       syscall


