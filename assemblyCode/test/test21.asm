; ��������CS:IPָ���һ��ָ��

assume cs:code

data segment
	dd 12345678h
data ends

code segment
start:	mov ax,data
		mov ds,ax
		mov bx,0
		mov [bx],bx
		mov [bx+2],cs; ע�⣺mov����Ϊcx��ֵ�������ܰ�cx��ֵ������ļĴ���/�ڴ�
		jmp dword ptr ds:[0]; ip����Ϊ��λ�֣�cs����Ϊ��λ��

code ends

end start