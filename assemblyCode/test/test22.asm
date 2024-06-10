; 案例：查找到2000:0开始的第一个值为0的字节，将其偏移地址存储在dx中

assume cs:code

code segment
start:	mov ax,2000h
		mov ds,ax
		mov bx,0; bx用于存储偏移地址
		mov ch,0
		
		; 思路：用jmp指令实现死循环，用jcxz判断是否为0，若是0则退出
s1:		mov cl,[bx]
		jcxz s2
		inc bx
		jmp short s1
	
		; 若跳出s1循环，说明此时[bx]中的值为0
s2:		mov dx,bx
		
		mov ax,4c00h
		int 21h
code ends

end start