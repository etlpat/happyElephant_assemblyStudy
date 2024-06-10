; 案例：①将字符串1拷贝到空字符串2中
;		②将F000H段的最后16个字节传输到str3中

assume ds:data,cs:code

data segment
	str1 db 'Welcome to masm$'
	str2 db 16 dup(0)
	str3 db 16 dup(0)
data ends


code segment
start:	mov ax,data
		mov ds,ax
		mov es,ax
		
		; ①将字符串1拷贝到空字符串2中
		cld; 将dp清零，保证movsb递增
		mov si,offset str1
		mov di,offset str2
		mov cx,16
		rep movsb; 将movsb执行16次
		
		;打印str2
		mov ah,9
		mov dx,offset str2
		int 21h
		
		; ②将F000H段的最后16个字节传输到str3中
		mov ax,0f000h
		mov ds,ax
		mov si,0ffffh
		mov di,offset str3 + 15; 这里是倒着存，di也必须是末尾地址
		std; 将dp设为1，使得movsb后si、di递减
		mov cx,16
		rep movsb
		
		mov ax,4c00h
		int 21h
code ends

end start
