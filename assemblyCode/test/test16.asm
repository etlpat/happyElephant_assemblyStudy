assume ds:datasg,cs:codesg

datasg segment
	mystring db 'abcdef','$'
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		mov ah,09h
		mov dx,offset mystring; ���ַ�����ƫ�Ƶ�ַ����dx
		int 21h
	
		mov ax,4c00h
		int 21h
codesg ends

end start