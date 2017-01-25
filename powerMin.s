.code64
.globl power
.type power, @function
power:
	push %rbp
	movq %rsp, %rbp

	movq %rdi, %rax

power_loop_start:
	cmpq $1, %rsi
	je end_power

	imulq %rdi, %rax
	decq %rsi

	jmp power_loop_start

end_power:
	leave
	ret
