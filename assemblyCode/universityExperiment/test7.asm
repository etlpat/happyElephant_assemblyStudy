assume ds:data,cs:code

data segment
	x db -65
	y db ?
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		cmp [x],0
		jge s1; ��x>=0������s1�������������ִ��
		mov dl,'0'; x<0ʱ��dl��Ϊ'0'
		jmp s2
s1:		mov dl,'1'; x>=0ʱ��dl��Ϊ'1'

s2:		mov [y],dl; ������ַ����浽y
		; ����Ļ����ַ�
		mov ah,2
		int 21h
		
		; ��������
		mov ax,4c00h
		int 21h
code ends

end start