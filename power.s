.code64
.section .data
.section .text
.globl _start
_start:
	movq $5, %rdi
	movq $2, %rsi
	call power			# call power(5,2)

	push %rax			# store return value on the stack

	movq $3, %rdi
	movq $2, %rsi
	call power			# call power(3,2)

	pop %rbx			# pop first return value to %rbx
	add %rbx, %rax		# %rax += %rbx

	mov %rax, %rdi      # move %rax to rdi to return value to system
	mov $60, %rax		#sys_exit()
	syscall

#PURPOSE: used to compute the value of a number raised to a power
#
#INPUT:	  %rdi - First argument - base number
#		  %rsi - Second argument - the power to raise it to
#
#OUTPUT: Will give the result as a return value
#
#NOTES: power must be > 1
#
#VARIABLES:
#			%rdi - holds the base number
#			%rsi - holds the power
#			%rax is used for temporary storage and the return value
#
#CLOBERED REGISTERS:  %rdi, %rax, %rsi
.type power, @function
power:

	push %rbp			 # function prolog
	movq %rsp, %rbp
	movq %rdi, %rax		 # copies base to rax so we can work with it

power_loop_start:
	cmpq $1, %rsi		 # if the power is 1, we are done
	je end_power

	imulq %rdi,%rax		 # multiply the base by the current value
	decq %rsi			 # power--

	jmp power_loop_start # Run for the next power

end_power:
	leave				 # this should cover the epilog
	ret					 # return %rax
