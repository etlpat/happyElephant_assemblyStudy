assume ds:data,cs:code

data segment
	score db 77,82,65,94,76,88,83,98,65,72
	max db ?
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		mov al,[score]; al����ѱ�����ѧ���ɼ������ֵ
		mov si,offset score + 1; si��ʼָ��ڶ���ѧ��
		mov cx,9; ѭ��9��
s1:
		cmp al,[si]
		jge s2; ��al>=[si]������s2
		mov al,[si]
s2:		inc si
		loop s1
		
		mov [max],al
		
		mov ax,4c00h
		int 21h
code ends

end start