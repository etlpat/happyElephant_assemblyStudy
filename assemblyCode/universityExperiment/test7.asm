assume ds:data,cs:code

data segment
	x db -65
	y db ?
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		cmp [x],0
		jge s1; 若x>=0，跳到s1，否则继续向下执行
		mov dl,'0'; x<0时，dl赋为'0'
		jmp s2
s1:		mov dl,'1'; x>=0时，dl赋为'1'

s2:		mov [y],dl; 将输出字符保存到y
		; 从屏幕输出字符
		mov ah,2
		int 21h
		
		; 结束程序
		mov ax,4c00h
		int 21h
code ends

end start