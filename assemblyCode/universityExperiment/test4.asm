assume ds:data,cs:code

data segment
	buffer db 102 dup(0)
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		; ����10�Ź��������ַ���
		mov [buffer],100; buffer�ĵ�һ���ֽڴ������ַ���
		mov ah,10
		mov dx,offset buffer
		int 21h
		; 10�Ź��ܽ�����
		; �ַ����ĵ�һ���ֽڴ������ַ�����
		; �ַ����ĵڶ����ֽڴ��ʵ�ʵ��ַ��������������س���
		; �ӵ������ֽڿ�ʼ�����������ַ���
		
		mov si,offset buffer+2; si����ַ��׵�ַ
		mov ch,0
		mov cl,[buffer+1]; cx���ʵ���ַ�����
		mov bl,0; bl���Сд��ĸ����
		mov bh,0; bh��Ŵ�д��ĸ����
		mov dh,0; dh������ָ���
		mov dl,0; dl��������ַ�����
		
		
s:		; ��ʼѭ��
		mov al,[si]; al����ַ����е�ÿ���ַ�
		; �ж��Ƿ�ΪСд��ĸ
		cmp al,'z'
		ja s3
		cmp al,'a'
		jb s1
		inc bl
		jmp short s4
s1:		; �ж��Ƿ�Ϊ��д��ĸ
		cmp al,'Z'
		ja s3
		cmp al,'A'
		jb s2
		inc bh
		jmp short s4
s2:		; �ж��Ƿ�Ϊ����
		cmp al,'9'
		ja s3
		cmp al,'0'
		jb s3
		inc dh
		jmp short s4
s3:		; �����ַ�
		inc dl
s4:		; �����жϽ���
		inc si
		loop s

		
		mov ax,4c00h
		int 21h
code ends

end start
