; �������������'a'��'z'


assume cs:code

code segment
		mov ah,2; 2�Ź��ܣ����dl�е�ascii��
		mov dl,'a'
s:		int 21h
		inc dl
		cmp dl,'z'
		jbe s; ��dl<=z������s���
		
		mov ax,4c00h
		int 21h
code ends

end