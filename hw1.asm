.data    
	space: .asciiz " "

.text

	main:
		#reads inputed number
		li $v0, 5
		syscall
		move $s0, $v0
		
		addi $t9, $zero, 3
		while: # for(int i=3; i>0; i--)
			# calculates (startingNum mod i-th digit from the right).
			# i-th digit is calculated by formula:
			# (startingNum mod 10^i) : 10^(i-1).
			blt $t9, 1, exit
		
			addi $a1, $zero, 10
			add $a2, $zero, $t9
			jal power
			
			add $a1, $zero, $s0
			add $a2, $zero, $v1
			jal remainder
			add $s1, $zero, $v1
			
			subi $s2, $t9, 1
			addi $a1, $zero, 10
			add $a2, $zero, $s2
			jal power
			add $s2, $zero, $v1
			
			div $s3, $s1, $s2
			
			add $a1, $zero, $s0
			add $a2, $zero, $s3
			jal remainder
			
			li $v0,1
    			la $a0, ($v1)
    			syscall
    			
    			li $v0,4
    			la $a0, space
    			syscall
    			
    			subi $t9, $t9, 1
    			j while
		
		exit:
    		
    		li $v0, 10
    		syscall
    	
    	remainder:
    		#calculates a1 mod a2.
    		move $t0, $a1
    		move $t1, $a2
    		
    		div $t3, $t0, $t1
		mul $t4, $t3, $t1
		sub $v1, $t0, $t4
		
		jr $ra
		
	power: 
		#calculates a1^a2.
		addi $t0, $zero, 1
    		move $t1, $a2
    		
    		addi $t2, $zero, 1
    		
    		whilePower:
			
    			bgt $t2, $t1, exitPower
    			mul $t0, $a1, $t0
    			addi $t2, $t2, 1
    			j whilePower
    		exitPower:	
    			move $v1, $t0
    			jr $ra
    	
       
    		
    
    			
	
	
	
	
	