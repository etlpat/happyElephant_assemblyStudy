; ��������ffff:0~ffff:f�οռ��ֵ������20:0~20:f��

assume cs:sg1
sg1 segment
; ˼·���������漰���������Σ���һ��ds��������
; 		��ô�����ǿ���������չ��es���������ǰ׺������һ����ʹ�õĶ�
		mov ax,20h
		mov ds,ax
		mov ax,0ffffh
		mov es,ax
		
		mov bx,0
		mov cx,10h
add_label:
		mov al,es:[bx]; �Ƚ�ffff:[bx]��ֵ����al
		mov [bx],al; �ٽ�al��ֵ����20:[bx]
		inc bx; bx����1
		loop add_label
		
		mov ax,4c00h
		int 21h
sg1 ends
end