assume cs:code

code segment
start:
		; ����1�Ź��ܣ���ȡ����������ַ�������al�У�
		mov ah,01h
		int 21h		
		mov dl,al; dl��Ż�ȡ�ַ���ascii��

		; ����Сд�ַ�
		cmp dl,'z'
		ja s3
		cmp dl,'a'
		jb s1
		and dl,11011111b; Сдת��д
		jmp short s2

s1:		; �����д�ַ�
		cmp dl,'Z'
		ja s3
		cmp dl,'A'
		jb s3
		or dl,00100000b; ��дתСд
		
s2:		; ����2�Ź��ܣ����ת���Сд����ַ�
		mov ah,02h
		int 21h

s3:		; �˳�����
		mov ax,4c00h
		int 21h
code ends

end start