assume cs:codesg1

codesg1 segment
	mov ax,2000h; ��h�����ֱ�ʾʮ������
	mov ss,ax
	mov sp,10; ����h�����ֱ�ʾ10����
	pop ax
	pop bx
	push ax
	push bx
	pop ax
	pop bx

	mov ax,4c00h
	int 21h	
codesg1 ends

end