.global _start

.text

_start:
    movq $10, %r8				# moving the number in %r8
	movq $10, %rdi				# for the purpose of multiplying 
	movq $1, %r11				# for the purpose of multiplying
	movq $0, %rbx				# for keeping the count of the number

.Loop:
	je .zero
	incq %rdi					# incrementing %rdi for increasing the counter for factorial 
	incq %rbx					# the counter of the number whose factorial is being calculated
	imulq %rdi, %r11			# to find factorial
	movq $0, %rdx				# moving 0 to %rdx for using in division
	movq %r11, %rax				# moving %r11 into %rax for using in division for quotient purpose
	divq %r8					# dividing by %r8
	cmpq $0, %rdx				# comparing if the remainder is equal to 0 or not
	jne .Loop					# if not equal to 0 then again go to loop
	movq %rbx, %r11				# otherwise move %rbx %r11 which is the number whose factorial is divisible by x

.exit:							# this is just for exitting
	movq $60, %rax
	xor %rdi, %rdi
	syscall
