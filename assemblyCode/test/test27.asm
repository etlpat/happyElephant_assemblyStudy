; ������ͳ��������8�ĸ���

assume ds:data,cs:code

data segment
	arr1 db 8,11,8,1,8,5,11,45,19,8,10
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		mov cx,11
		mov si,offset arr1; si��¼�����׵�ַ
		mov bx,0; bx��¼8�ĸ���
		mov al,8
s:		
		cmp al,[si]
		jne s1
		inc bx
s1:		inc si
		loop s
		
		mov ax,4c00h
		int 21h
code ends

end start