//find_min.s
.data 
	 fmt:.asciz "min = %d\n" 
	 fmt1:.asciz "%d"
	 n:.word 0
	 a:.word 0
.text 
.globl main 
 main: 
	 push {lr}         
	 mov r4,#1 // i = 1             
	 // 读入n
	 ldr r0,=fmt1
	 ldr r1,=n
	 bl scanf
	 // 读入a
	 ldr r0,=fmt1
	 ldr r1,=a
	 bl scanf
	 // scanf后要重新载入
	 ldr r1, =n
	 ldr r1,[r1]
	 ldr r2, =a
	 ldr r3,[r2] // min_num=a
	 ldr r2,[r2]
	 b  L1 
loop: 
    	 // 读入a
	 ldr r0, =fmt1
    	 ldr r1, =a
    	 bl scanf
    	 ldr r1, =n
    	 ldr r1,[r1] 
    	 ldr r2, =a
    	 ldr r2,[r2]
	 cmp  r2,r3        	 
    	 movgt r3,r2   // 将较小的值放到r3
	 add r4,#1 // i+1
L1:     
	cmp r4,r1   // i<n?
	blo loop   
	
	ldr r0, =fmt      
	mov r1,r3  //r3存放min
	bl printf        
	mov r0, #0       
	pop {lr}  
	mov pc, lr            
.end
