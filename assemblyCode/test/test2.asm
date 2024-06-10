assume cs:codesg1

codesg1 segment
	mov ax,2000h; 加h的数字表示十六进制
	mov ss,ax
	mov sp,10; 不加h的数字表示10进制
	pop ax
	pop bx
	push ax
	push bx
	pop ax
	pop bx

	mov ax,4c00h
	int 21h	
codesg1 ends

end