; ���������ҵ�2000:0��ʼ�ĵ�һ��ֵΪ0���ֽڣ�����ƫ�Ƶ�ַ�洢��dx��

assume cs:code

code segment
start:	mov ax,2000h
		mov ds,ax
		mov bx,0; bx���ڴ洢ƫ�Ƶ�ַ
		mov ch,0
		
		; ˼·����jmpָ��ʵ����ѭ������jcxz�ж��Ƿ�Ϊ0������0���˳�
s1:		mov cl,[bx]
		jcxz s2
		inc bx
		jmp short s1
	
		; ������s1ѭ����˵����ʱ[bx]�е�ֵΪ0
s2:		mov dx,bx
		
		mov ax,4c00h
		int 21h
code ends

end start