; 案例：利用子程序，将多个小写的字符串转为大写
;		注意：本题字符串以'\0结尾'

assume ds:data,ss:stack,cs:code

data segment
	db 'world',0,0,0,0,0,0,0,0,0,0,'$'
	db 'hello',0,0,0,0,0,0,0,0,0,0,'$'
	db 'hamburger',0,0,0,0,0,0,'$'
	db 'assemblycode',0,0,0,'$'
	; 以上每个字符串都是16位
data ends


stack segment
	dw 8 dup(0)
stack ends


code segment
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov cx,4
		mov si,0; si存储字符串的首地址
s:		
		mov ah,9; 打印小写串
		mov dx,si
		int 21h
		call ucast; 将小写串转为大写串
		mov ah,9; 打印大写串
		mov dx,si
		int 21h
		add si,16; si指向下一串
		loop s
		
		mov ax,4c00h
		int 21h
		
		
; 子程序：将以'\0'结尾的字符串小写转大写
ucast:
		mov al,11011111b
		mov di,si; di存放字符串的首地址
		push cx; cx入栈，保存外层循环变量
		mov ch,0
	s1:	mov cl,[di]; 进入死循环，直到遇到'\0'跳出循环
		jcxz s2
		and [di],al; 小写变大写
		inc di
		jmp short s1
	s2:	pop cx; 外层循环cx出栈
		ret


code ends

end start