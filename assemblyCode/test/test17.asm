; 案例：先将字符串全部转换为大写
;		再将字符串全部转换为小写

assume ds:datasg,cs:codesg

datasg segment
	mystring db 'abcdefgh','$'
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		; 先输出原本的字符串
		mov ah,9h
		mov dx,offset mystring
		int 21h
			
		; 将字符串转换为大写
		mov cx,8
		mov al,11011111b
		mov bx,0
s1:		and [mystring+bx],al; 小写转大写：把ascii的第6置为0
		inc bx
		loop s1
		
		; 输出变化后的字符串
		mov ah,9h
		mov dx,offset mystring
		int 21h
		
		; 将字符串转换为小写
		mov cx,8
		mov al,00100000b
		mov bx,0
s2:		or [mystring+bx],al; 大写转小写：把ascii的第6置为1
		inc bx
		loop s2
		
		; 输出变化后的字符串
		mov ah,9h
		mov dx,offset mystring
		int 21h
	
		mov ax,4c00h
		int 21h
codesg ends

end start