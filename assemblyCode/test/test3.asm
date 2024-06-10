assume cs:codesg1

codesg1 segment

	mov ax,2000h
	mov ds,ax; 设置ds
	mov ax,0ffffh
	mov ds:[0],ax
	mov ds:[2],ax; 将[0]~[3]置为全f
	
	; 使用debug查看MASM中[0]和ds:[0]用法的区别
	mov ah,[0]
	mov al,ds:[0]
	mov bh,[1]
	mov bl,ds:[1]
	mov ch,[2]
	mov cl,ds:[2]
	mov dh,[3]
	mov dl,ds:[3]
	; MASM编译器，会把[数字]当成其中的数字处理
	; 若想表示存储器直接寻址，需要添加ds段前缀，即ds:[数字]
	
	;mov [1],ax; 报错，[1]被视作立即数
	mov ds:[1],ax
	
	mov ax,4c00h
	int 21h

codesg1 ends

end