; �������ٽ��ַ���1���������ַ���2��
;		�ڽ�F000H�ε����16���ֽڴ��䵽str3��

assume ds:data,cs:code

data segment
	str1 db 'Welcome to masm$'
	str2 db 16 dup(0)
	str3 db 16 dup(0)
data ends


code segment
start:	mov ax,data
		mov ds,ax
		mov es,ax
		
		; �ٽ��ַ���1���������ַ���2��
		cld; ��dp���㣬��֤movsb����
		mov si,offset str1
		mov di,offset str2
		mov cx,16
		rep movsb; ��movsbִ��16��
		
		;��ӡstr2
		mov ah,9
		mov dx,offset str2
		int 21h
		
		; �ڽ�F000H�ε����16���ֽڴ��䵽str3��
		mov ax,0f000h
		mov ds,ax
		mov si,0ffffh
		mov di,offset str3 + 15; �����ǵ��Ŵ棬diҲ������ĩβ��ַ
		std; ��dp��Ϊ1��ʹ��movsb��si��di�ݼ�
		mov cx,16
		rep movsb
		
		mov ax,4c00h
		int 21h
code ends

end start
