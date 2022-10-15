//math.s
.data
	fmt:.asciz "%d %d"
	fmt1:.asciz "a + b = %d\n"
	fmt2:.asciz "a - b = %d\n"
	fmt3:.asciz "a * b = %d\n"
	fmt4:.asciz "a / b = %d\n"
	fmt5:.asciz "a %% b = %d\n"
	a:.word 0
	b:.word 0
.text
.globl main
main:
	stmfd	sp!,{lr} //把返回地址推到堆栈
	// 读入a,b
	ldr	r0,=fmt
	ldr	r1,=a 
	ldr	r2,=b 
	bl	scanf
	// a+b
	ldr	r1,=a 
	ldr	r4,[r1] // r4->a
	ldr	r2,=b 
	ldr	r5,[r2] // r5->b
	add	r1,r5,r4 // r1->a+b
	ldr	r0,=fmt1
	bl	printf
	// a-b
	ldr	r1,=a 
	ldr	r4,[r1]
	ldr	r2,=b 
	ldr	r5,[r2]
	sub	r1,r4,r5 // r1->a-b
	ldr	r0,=fmt2
	bl	printf
	// a*b
	ldr	r1,=a 
	ldr	r4,[r1]
	ldr	r2,=b 
	ldr	r5,[r2]
	mul	r1,r5,r4 // r1->a*b
	ldr	r0,=fmt3
	bl	printf
	
	ldr	r0,=a
	ldr	r0,[r0]
	ldr	r1,=b
	ldr	r1,[r1]
	bl	__aeabi_idivmod
	// r0->a/b r1->a%b
	mov	r4,r0 //r4->a/b
	mov	r5,r1 //r5->a%b
	//printf
	mov	r1,r4
	ldr	r0,=fmt4
	bl	printf
	//printf
	mov	r1,r5
	ldr	r0,=fmt5
	bl	printf
	// return
	mov	r0,#0
	ldmfd	sp!,{lr}
	mov	pc,lr
.end