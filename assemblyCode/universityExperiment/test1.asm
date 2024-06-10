assume ds:data,cs:code

data segment
	x dw -1
	y dw 1
	z dw 0
	max dw ?
data ends

code segment
start:	
		mov ax,data
		mov ds,ax
		
		mov ax,[x]; ax用于存放最大值
		cmp ax,[y]
		jge s1; 若ax>=y则跳到s1
		mov ax,[y]
s1:		
		cmp ax,[z]
		jge s2; 若ax>=z则跳到s2
		mov ax,[z]
s2:
		mov [max],ax

		mov ax,4c00h
		int 21h
code ends

end start