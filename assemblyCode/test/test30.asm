assume cs:code,ds:data

data segment
	a1 dw 1,2,'12'
	a2 db 4 dup(?)
	a3 dd 0
	a4 equ a3-a1
data ends

code segment
start:	mov ax,data
		mov ds,ax

		mov ax,4c00h
		int 21h
code ends

end start