; �������������ݶ��е�һ�����ݵ����η������������ڶ������ݵ�Ԫ��
;		ע�⣺���ӳ����װ����x^3

assume ds:data,cs:code,ss:stack

data segment
	arr1 dw 1,2,3,4,5,6,7,8
	arr2 dd 8 dup(0)
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
		
		mov cx,8
		mov si,0
		mov di,0
s:		
		mov bx,[arr1+si]; bx����Ҫ�������η�������
		call third_power
		; �ӳ����ret���ش˴�����ʱ��������dx,ax��
		mov word ptr [arr2+di],ax
		mov word ptr [arr2+di+2],dx
		add si,2
		add di,4
		loop s
		
		mov ax,4c00h
		int 21h
		
		
; ����bx���η����ӳ������ս������dx,ax��
third_power:
		mov ax,bx
		mul bx
		mul bx;
		ret
code ends

end start
