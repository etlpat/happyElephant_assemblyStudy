; 案例：利用栈，将arr1中的值逆序存放到arr2中

assume ds:datasg,ss:stacksg,cs:codesg

datasg segment
	arr1 dw 123h,234h,345h,456h,567h,678h,789h,890h
	arr2 dw 0,0,0,0,0,0,0,0
datasg ends


stacksg segment
	mystack dw 0,0,0,0,0,0,0,0
stacksg ends


codesg segment
start:	mov ax,datasg
		mov ds,ax
		mov ax,stacksg
		mov ss,ax
		mov sp,offset mystack
		add sp,16
		
		;将arr1中的数据入栈
		mov cx,8
		mov bx,0
s1:		push [arr1+bx]
		add bx,2
		loop s1
		
		; 将栈中值出栈到arr2中
		mov cx,8
		mov bx,0
s2:		pop [arr2+bx]
		add bx,2
		loop s2
		
		mov ax,4c00h
		int 21h
codesg ends

end start
