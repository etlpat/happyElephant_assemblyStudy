; �������Ƚ��ַ���ȫ��ת��Ϊ��д
;		�ٽ��ַ���ȫ��ת��ΪСд

assume ds:datasg,cs:codesg

datasg segment
	mystring db 'abcdefgh','$'
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		; �����ԭ�����ַ���
		mov ah,9h
		mov dx,offset mystring
		int 21h
			
		; ���ַ���ת��Ϊ��д
		mov cx,8
		mov al,11011111b
		mov bx,0
s1:		and [mystring+bx],al; Сдת��д����ascii�ĵ�6��Ϊ0
		inc bx
		loop s1
		
		; ����仯����ַ���
		mov ah,9h
		mov dx,offset mystring
		int 21h
		
		; ���ַ���ת��ΪСд
		mov cx,8
		mov al,00100000b
		mov bx,0
s2:		or [mystring+bx],al; ��дתСд����ascii�ĵ�6��Ϊ1
		inc bx
		loop s2
		
		; ����仯����ַ���
		mov ah,9h
		mov dx,offset mystring
		int 21h
	
		mov ax,4c00h
		int 21h
codesg ends

end start