assume ds:data,cs:code

data segment
	buf db 'a','b','c','d','e','z','f','g','h','i'
	max db ?
data ends


code segment
start:	mov ax,data
		mov ds,ax
		
		mov al,0; al���ڴ���Ѿ������������ֵ
		mov si,offset buf; si����׵�ַ
		mov cx,10; cx���ѭ������
		
s:		; ����ѭ��
		cmp al,[si]
		jae s1
		mov al,[si]; ��֤alһֱ�����ֵ
s1:		
		inc si
		loop s
		; loop���ܣ�
		; ��cx--
		; ���ж�cxֵ������Ϊ0������s����ţ�
		;			 ��Ϊ0�����ִ��
		
		
		; ѭ��������al��Ϊascii���ֵ
		mov [max],al
		
		
		; ����2�Ź��ܣ���ӡmax�е��ַ�����Ļ
		mov ah,2
		mov dl,[max]
		int 21h
		
		; �˳�����
		mov ax,4c00h
		int 21h
code ends

end start