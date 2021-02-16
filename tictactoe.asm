.data

P1Msg:			.asciiz		"Player 1 (X), Enter number of slot to mark: "
P2Msg:			.asciiz		"Player 2 (O), Enter number of slot to mark: "

P1Win:			.asciiz		"Player 1 Wins!!"
P2Win:			.asciiz		"Player 2 Wins!!"
TieWin:			.asciiz		"Game Over, it is a TIE!"

X:			.asciiz		"X"
O:			.asciiz		"O"
EmptySlot:		.asciiz		"-"

InvalidMsg:		.asciiz		"\nError: Invalid entry or slot already marked. Please try again...\n"

num1:			.asciiz		"1"
num2:			.asciiz		"2"
num3:			.asciiz		"3"
num4:			.asciiz		"4"
num5:			.asciiz		"5"
num6:			.asciiz		"6"
num7:			.asciiz		"7"
num8:			.asciiz		"8"
num9:			.asciiz		"9"

NumberBoard:		.asciiz		" _______ _______ _______\n|       |       |       |\n|   1   |   2   |   3   |\n|_______|_______|_______|\n|       |       |       |\n|   4   |   5   |   6   |\n|_______|_______|_______|\n|       |       |       |\n|   7   |   8   |   9   |\n|_______|_______|_______|\n\n"
					         

HLine1:			.asciiz		" _______ _______ _______\n"
HLine2:			.asciiz		"|_______|_______|_______|\n"
VLine1:			.asciiz		"|       |       |       |\n"
VLine2:			.asciiz		"|   "
VLine3:			.asciiz		"   "

NewLine:		.asciiz		"\n"




.text
# Load Ascii values of the numbers into the registers to print	
main:
	li	$t1, 49
	li	$t2, 50
	li	$t3, 51
	li	$t4, 52	
	li	$t5, 53
	li	$t6, 54
	li	$t7, 55
	li	$t8, 56
	li	$t9, 57

# Use $s0 to keep track of who's turn it is
	li	$s0, 1

# Use $s1 to keep track of how many moves have been made. 
	li	$s1, 0

# Print Boards****************************
Board:	

# Numbered Board
#li	$v0, 4
#la	$a0, NumberBoard
#syscall

# Marked Board


	li	$v0, 4
	la	$a0, HLine1
	syscall

	li	$v0, 4
	la	$a0, VLine1
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 1
	li	$v0, 11
	move	$a0, $t1
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 2
	li	$v0, 11
	move	$a0, $t2
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4	
	la	$a0, VLine2
	syscall

# Print slot number 3
	li	$v0, 11
	move	$a0, $t3
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

	li	$v0, 4
	la	$a0, NewLine
	syscall

	li	$v0, 4
	la	$a0, HLine2
	syscall

	li	$v0, 4
	la	$a0, VLine1
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 4
	li	$v0, 11
	move	$a0, $t4
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 5
	li	$v0, 11
	move	$a0, $t5
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 6
	li	$v0, 11
	move	$a0, $t6
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

	li	$v0, 4
	la	$a0, NewLine
	syscall

	li	$v0, 4
	la	$a0, HLine2
	syscall

	li	$v0, 4
	la	$a0, VLine1
	syscall
	
	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 7
	li	$v0, 11
	move	$a0, $t7
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall
	
	li	$v0, 4
	la	$a0, VLine2
	syscall
	
# Print slot number 8
	li	$v0, 11
	move	$a0, $t8
	syscall

	li	$v0, 4
	la	$a0, VLine3	
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

# Print slot number 9
	li	$v0, 11
	move	$a0, $t9
	syscall

	li	$v0, 4
	la	$a0, VLine3
	syscall

	li	$v0, 4
	la	$a0, VLine2
	syscall

	li	$v0, 4
	la	$a0, NewLine
	syscall

	li	$v0, 4
	la	$a0, HLine2
	syscall

	li	$v0, 4
	la	$a0, NewLine
	syscall
# END OF BOARDS LOOP**********************

#Check for wins
	j	CheckWin


# Check who's turn it is
CheckInput:
	beq	$s0, 1, P1Input
	beq	$s0, 2, P2Input

#Get users input
# Player 1 input
P1Input:
	li 	$v0, 4
	la 	$a0, P1Msg
	syscall

	li	$v0, 5
	syscall
	move	$t0, $v0

# Alternate turn to player 2
	li	$s0, 2

	j	UpdateBoardX

# Player 2 input
P2Input:
	li 	$v0, 4
	la 	$a0, P2Msg
	syscall

	li	$v0, 5
	syscall
	move	$t0, $v0

# Alternate turn to player 1
	li	$s0, 1

	j	UpdateBoardO

# BOARD UPDATES ******************************************

InvalidP1:
	li	$v0, 4
	la	$a0, InvalidMsg
	syscall
	j	P1Input

InvalidP2:
	li	$v0, 4
	la	$a0, InvalidMsg
	syscall
	j	P2Input

# Update board with player 1 option
UpdateBoardX:
	beq	$t0, 1, s1x
	beq	$t0, 2, s2x
	beq	$t0, 3, s3x
	beq	$t0, 4, s4x
	beq	$t0, 5, s5x	
	beq	$t0, 6, s6x
	beq	$t0, 7, s7x
	beq	$t0, 8, s8x
	beq	$t0, 9, s9x

	li	$v0, 4
	la	$a0, InvalidP1
	syscall 

	j	ExitProgram

# Update board with player 2 option
UpdateBoardO:
	beq	$t0, 1, s1o
	beq	$t0, 2, s2o
	beq	$t0, 3, s3o
	beq	$t0, 4, s4o
	beq	$t0, 5, s5o
	beq	$t0, 6, s6o
	beq	$t0, 7, s7o
	beq	$t0, 8, s8o
	beq	$t0, 9, s9o
	
	li	$v0, 4
	la	$a0, InvalidP2
	syscall

	j	ExitProgram



# BOARD UPDATES with ascii value of X
s1x:
	beq	$t1, 79, InvalidP1
	beq	$t1, 88, InvalidP1
	
	li	$t1, 88
	j	Board
s2x:
	beq	$t2, 79, InvalidP1
	beq	$t2, 88, InvalidP1

	li	$t2, 88
	j	Board
s3x:
	beq	$t3, 79, InvalidP1
	beq	$t3, 88, InvalidP1

	li	$t3, 88
	j	Board
s4x:
	beq	$t4, 79, InvalidP1
	beq	$t4, 88, InvalidP1

	li	$t4, 88
	j	Board
s5x:
	beq	$t5, 79, InvalidP1
	beq	$t5, 88, InvalidP1

	li	$t5, 88
	j	Board
s6x:
	beq	$t6, 79, InvalidP1
	beq	$t6, 88, InvalidP1

	li	$t6, 88
	j	Board
s7x:
	beq	$t7, 79, InvalidP1
	beq	$t7, 88, InvalidP1

	li	$t7, 88
	j	Board
s8x:
	beq	$t8, 79, InvalidP1
	beq	$t8, 88, InvalidP1

	li	$t8, 88
	j	Board
s9x:
	beq	$t9, 79, InvalidP1
	beq	$t9, 88, InvalidP1

	li	$t9, 88
	j	Board

# BOARD UPDATES with ascii value of O
s1o:
	beq	$t1, 79, InvalidP2
	beq	$t1, 88, InvalidP2

	li	$t1, 79
	j	Board
s2o:
	beq	$t2, 79, InvalidP2
	beq	$t2, 88, InvalidP2

	li	$t2, 79
	j	Board
s3o:
	beq	$t3, 79, InvalidP2
	beq	$t3, 88, InvalidP2

	li	$t3, 79
	j	Board
s4o:
	beq	$t4, 79, InvalidP2
	beq	$t4, 88, InvalidP2

	li	$t4, 79
	j	Board
s5o:
	beq	$t5, 79, InvalidP2
	beq	$t5, 88, InvalidP2

	li	$t5, 79
	j	Board
s6o:
	beq	$t6, 79, InvalidP2
	beq	$t6, 88, InvalidP2

	li	$t6, 79
	j	Board
s7o:
	beq	$t7, 79, InvalidP2
	beq	$t7, 88, InvalidP2

	li	$t7, 79
	j	Board
s8o:
	beq	$t8, 79, InvalidP2
	beq	$t8, 88, InvalidP2

	li	$t8, 79
	j	Board
s9o:
	beq	$t9, 79, InvalidP2
	beq	$t9, 88, InvalidP2

	li	$t9, 79
	j	Board

# END OF BOARD UPDATES ******************************

# Check if someone won*************************
CheckWin:

	addi	$s1, $s1, 1

S1.2:
	beq	$t1, $t2, S2.3
	b	S1.4

S2.3:
	beq	$t2, $t3, CheckWinner.1
	b	S1.4

S1.4:
	beq	$t1, $t4, S4.7
	b	S1.5

S4.7:
	beq	$t4, $t7, CheckWinner.1
	b	S1.5

S1.5:
	beq	$t1, $t5, S5.9
	b	S9.6

S5.9:
	beq	$t5, $t9, CheckWinner.1
	b	S9.6

S9.6:
	beq	$t9, $t6, S6.3
	b	S9.8

S6.3:
	beq	$t6, $t3, CheckWinner.9
	b 	S9.8

S9.8:
	beq	$t9, $t8, S8.7
	b	S2.5

S8.7:
	beq	$t8, $t7, CheckWinner.9
	b	S2.5

S2.5:	
	beq	$t2, $t5, S5.8
	b	S3.5

S5.8:
	beq	$t5, $t8, CheckWinner.2
	b	S3.5

S3.5:
	beq	$t3, $t5, S3.7
	b	S4.5

S3.7:
	beq	$t3, $t7 CheckWinner.3
	b	S4.5

S4.5:
	beq	$t4, $t5, S5.6
	b	Tie	

S5.6:
	beq	$t5, $t6, CheckWinner.4
	b	Tie
	
Tie:
	beq	$s1, 10, TieWon
	j	CheckInput


# END OF CHECK WIN**************************

# Check to see who the winner is
CheckWinner.1:
	beq	$t1, 88, P1Won
	beq	$t1, 79, P2Won

CheckWinner.9:
	beq	$t9, 88, P1Won
	beq	$t9, 79, P2Won

CheckWinner.2:
	beq	$t2, 88, P1Won
	beq	$t2, 79, P2Won

CheckWinner.3:
	beq	$t3, 88, P1Won
	beq	$t3, 79, P2Won

CheckWinner.4:
	beq	$t4, 88, P1Won
	beq	$t4, 79, P2Won	

	j	ExitProgram

# WINNER

P1Won:
	li	$v0, 4
	la	$a0 P1Win
	syscall
	j ExitProgram

P2Won:
	li	$v0, 4
	la	$a0 P2Win
	syscall
	j ExitProgram

TieWon:
	li	$v0, 4
	la	$a0 TieWin
	syscall
	j ExitProgram

#Exit Program 
ExitProgram:
	li	$v0, 10
	syscall