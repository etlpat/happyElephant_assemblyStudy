; ����������ջ����arr1�е�ֵ�����ŵ�arr2��

assume ds:datasg,ss:stacksg,cs:codesg

datasg segment
	arr1 dw 123h,234h,345h,456h,567h,678h,789h,890h
	arr2 dw 0,0,0,0,0,0,0,0
datasg ends


stacksg segment
	mystack dw 0,0,0,0,0,0,0,0
stacksg ends


codesg segment
start:	mov ax,datasg
		mov ds,ax
		mov ax,stacksg
		mov ss,ax
		mov sp,offset mystack
		add sp,16
		
		;��arr1�е�������ջ
		mov cx,8
		mov bx,0
s1:		push [arr1+bx]
		add bx,2
		loop s1
		
		; ��ջ��ֵ��ջ��arr2��
		mov cx,8
		mov bx,0
s2:		pop [arr2+bx]
		add bx,2
		loop s2
		
		mov ax,4c00h
		int 21h
codesg ends

end start
