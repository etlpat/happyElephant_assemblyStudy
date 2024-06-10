; 案例：统计数组中8的个数

assume ds:data,cs:code

data segment
	arr1 db 8,11,8,1,8,5,11,45,19,8,10
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		mov cx,11
		mov si,offset arr1; si记录数组首地址
		mov bx,0; bx记录8的个数
		mov al,8
s:		
		cmp al,[si]
		jne s1
		inc bx
s1:		inc si
		loop s
		
		mov ax,4c00h
		int 21h
code ends

end start