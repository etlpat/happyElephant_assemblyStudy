assume ds:data,cs:code

data segment
	buf db 12 dup(0)
	max db ?
data ends


code segment
start:	mov ax,data
		mov ds,ax
		
		; ����10�Ź��ܴ���Ļ�����ַ���
		mov [buf],10
		mov ah,10
		mov dx,offset buf
		int 21h
		
		mov al,[buf+2]; al���ڴ���Ѿ������������ֵ
		mov si,offset buf + 3
		mov ch,0
		mov cl,[buf+1]; cx��ʾѭ������
		dec cx
		
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