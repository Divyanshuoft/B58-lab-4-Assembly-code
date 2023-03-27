#name: Divyansh Kachchhava
#utorid: kachchha
#student_number: 1008378462

.text
.globl main

#It's the main thing which have everthing in it and the process follows in this order
main:
	# Initialize $t8 and $t9 to two positive integers
	addi $t8, $zero, 60 # setting first number st $t8
	addi $t9, $zero, 48 # setting second number at $t9
	# Print the values of a, b, and c with messages
	li $v0, 4               # load system call code for printing strings

	la $a0, value1          # load address of message for a into $a0
	syscall                 # print the message
	li $v0, 1               # load system call code for printing integers
	move $a0, $t8           # move value of a into $a0
	syscall                 # print the value of a
	li $v0, 4               # load system call code for printing strings
	la $a0, nl              # load address of newline character into $a0
	syscall                 # print newline

	li $v0, 4               # load system call code for printing strings
	la $a0, value2          # load address of message for b into $a0
	syscall                 # print the message
	li $v0, 1               # load system call code for printing integers
	move $a0, $t9           # move value of b into $a0
	syscall                 # print the value of b
	li $v0, 4               # load system call code for printing strings
	la $a0, nl              # load address of newline character into $a0
	syscall                 # print newline

	la $a0, start           # Load the address of the start message into $a0
	syscall
	
#Summary of the Euclid's algorithm
#Here as per the Euclid's alogrithm subract one number from another
#continue this process untill youn reaches the end
#The end can be identified as when the unmbers are equal to one another 
Loop:
    	la $a0, delta_msg # Load the address of the delta message into $a0
    	syscall          # print newline
    	#Loop terminating condition
    	beq $t8, $zero, EndLoop   # if $t8 == 0, go to EndLoop
    	beq $t9, $zero, EndLoop   # if $t9 == 0, go to EndLoop
    	bne $t8, $t9, Check       # if $t8 != $t9, go to Check
    	j EndLoop                 # if $t8 == $t9, go to EndLoop (Ending loop condition)
    	
#Programming if else conditions
Check:
	#Does the loop terminates?
    	slt $t3, $t8, $t9         # set $t3 to 1 if $t8 < $t9, 0 otherwise
    	beq $t3, $zero, Else      # if $t8 >= $t9, go to Else
    	sub $t9, $t9, $t8         # $t9 = $t9 - $t8
    	j Loop                    # go back to Loop so sad :(
Else:
    	sub $t8, $t8, $t9         # $t8 = $t8 - $t9
    	#Continue Looping
    	j Loop                    # go back to Loop

#This is the condition when we are terminating our loop
#This conditionis reached when both of our nunbers are equal
#Note: Here we're gonna check if the the number is zero or not
EndLoop:
    	bne $t8, $zero, PrintGCD  # if $t8 != 0, go to PrintGCD
    	move $t0, $t9             # store GCD in $t0
    	j Exit                    # go to Exit

#Printing our result
#Print the GCD value (our result :)
PrintGCD:
    	move $t0, $t8             # store GCD in $t0
	la $a0, end# Load the address of the delta message into $a0
	syscall  
	li $v0, 4       # load system call code for printing strings
	la $a0, message # load address of message to print
	syscall         # print message
	li $v0, 1       # load system call code for printing integers
	move $a0, $t0   # move GCD into $a0
	syscall         # print GCD value which is the required result

# Exiting the program code
Exit:
	li $v0, 10      # load system call code for exiting program
	syscall         # exit program call

#Printing statement messages which gives details about every line
.data
	message: .asciiz "The greatest common denominator is: "
	value1: .asciiz "The value of the first number is: "
	value2: .asciiz "The value of the second number is: "
	nl: .asciiz "\n"
	delta_msg: .asciiz "Looping....\n"
	start: .asciiz "Start Looping....\n"
	end: .asciiz "End Looping....\n"