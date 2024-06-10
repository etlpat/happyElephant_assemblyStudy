; 案例：是CS:IP指向第一条指令

assume cs:code

data segment
	dd 12345678h
data ends

code segment
start:	mov ax,data
		mov ds,ax
		mov bx,0
		mov [bx],bx
		mov [bx+2],cs; 注意：mov不能为cx赋值，但是能把cx的值赋给别的寄存器/内存
		jmp dword ptr ds:[0]; ip将改为低位字，cs将改为高位字

code ends

end start