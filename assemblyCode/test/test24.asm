; �����������ӳ��򣬽����Сд���ַ���תΪ��д
;		ע�⣺�����ַ�����'\0��β'

assume ds:data,ss:stack,cs:code

data segment
	db 'world',0,0,0,0,0,0,0,0,0,0,'$'
	db 'hello',0,0,0,0,0,0,0,0,0,0,'$'
	db 'hamburger',0,0,0,0,0,0,'$'
	db 'assemblycode',0,0,0,'$'
	; ����ÿ���ַ�������16λ
data ends


stack segment
	dw 8 dup(0)
stack ends


code segment
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov cx,4
		mov si,0; si�洢�ַ������׵�ַ
s:		
		mov ah,9; ��ӡСд��
		mov dx,si
		int 21h
		call ucast; ��Сд��תΪ��д��
		mov ah,9; ��ӡ��д��
		mov dx,si
		int 21h
		add si,16; siָ����һ��
		loop s
		
		mov ax,4c00h
		int 21h
		
		
; �ӳ��򣺽���'\0'��β���ַ���Сдת��д
ucast:
		mov al,11011111b
		mov di,si; di����ַ������׵�ַ
		push cx; cx��ջ���������ѭ������
		mov ch,0
	s1:	mov cl,[di]; ������ѭ����ֱ������'\0'����ѭ��
		jcxz s2
		and [di],al; Сд���д
		inc di
		jmp short s1
	s2:	pop cx; ���ѭ��cx��ջ
		ret


code ends

end start