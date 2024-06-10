assume ds:datasg,cs:codesg


datasg segment
	mychar1 db 'a'
	mychar2 db 'A'
	mystring db 'abcdef','$'
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		mov ah,09h
		mov dx,offset mystring
		int 21h
		
		mov ax,4c00h
		int 21h
codesg ends

end start