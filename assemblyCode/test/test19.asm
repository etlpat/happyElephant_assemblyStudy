; ��������x/y���������z��

assume ds:datasg,cs:codesg

datasg segment
	x dd 186a1h; �ڴ���Ϊ��a1 86 01 00
	y dw 64h; �ڴ���Ϊ��64 00
	z dw 0
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		mov dx,word ptr [x+2]; dx��Ϊ0001
		mov ax,word ptr [x]; ax��Ϊ86a1
		div word ptr [y]; ��dx,ax��ֵ��[y]��������dx������ax
		mov [z],ax

		mov ax,4c00h
		int 21h
codesg ends

end start