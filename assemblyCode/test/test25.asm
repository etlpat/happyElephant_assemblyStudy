; ���������ڴ���ʮ�����Ƶ����ݰ���ʮ�����ַ����洢�����

assume ds:data,ss:stack,cs:code

data segment
	arr1 dw 12345,1145,1919,2226,31415
	arr2 db 5 dup(0,0,0,0,0,0,0,0)
	ten dw 10; ��16��������10������������������10������
data ends


stack segment
	dw 8 dup (0)
stack ends


code segment
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov cx,5; cx��¼ѭ������
		mov si,offset arr1; ��si������������ַ
		mov di,offset arr2; ��di����ַ��������ַ
s:		
		call conversion_string; ��16�����������ַ�����
		add si,2
		add di,8
		loop s
			
		mov ax,4c00h
		int 21h
		
		
conversion_string: ; �ӳ��򣬽�16������ת��Ϊ�ַ���
		push cx
		mov bx,7; bx��¼�ַ���Ԫ���±�
		mov ax,[si]; dx,ax��¼������
		mov cx,ax
		jcxz s2; ��������Ϊ0��ֱ������ѭ��
	s1:	
		mov dx,0; ��֪��������dx��Ϊ0
		div word ptr [ten]; ��������10
		add dx,'0'; ������+'0'תΪ��Ӧ��ascii��
		mov [di+bx],dl; ascii�����ַ���
		dec bx
		mov cx,ax
		jcxz s2; ��������Ϊ0��ֱ������ѭ��
		jmp short s1
	s2:
		pop cx
		ret
code ends

end start