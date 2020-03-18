.global _start

.text

_start:
	movq $1, %r11			# storing 1 as acc
	movq $1, %r8			# storing a in register r8
	movq $0, %r9			# storing b in register r9
	movq $1,%r10			# storing n in register r10
	movq $0, %rdx
	movq %r8, %rax			# storing n in %rax for division
	idivq %r10				# dividing by n
	movq %rdx, %r8			# calculating a = a mod n

.Loop:
	cmpq $0, %r9
	jle .exit				# while b greater than 0 do following otherwise jump to End
	movq $0, %rdx
	mov %r9,%rax			
	movq $2, %r14			# dividing by 2 in order to see if it is even or odd
	idivq %r14
	cmp $0, %rdx			# checking if it is even or odd
	jne .Odd

.Next:
	movq $0, %rdx	
	sar $1,%r9 #  right shifting "b" so as to divide it by 2.
	imulq %r8, %r8		# storing a=a*a
	movq $0, %rdx
	movq %r8, %rax			# dividing it by n
	idivq %r10
	movq %rdx, %r8			# storing a=(a*a)mod n
	jmp .Loop

.Odd:
	imulq %r8, %r11		# storing acc= (acc*a)
	movq $0, %rdx
	movq %r11, %rax			# dividing acc by n
	idivq %r10
	movq %rdx, %r11			# storing acc=(acc*a)mod n
	jmp .Next

.exit:							# this is just for exiting
	movq $60, %rax
	mov $0,%rdi
	syscall
