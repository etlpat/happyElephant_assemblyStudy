; ����������ffff:0~ffffb���ֽڡ���Ԫ�е����ݺͣ��ѽ�������dx��

assume cs:sg1

sg1 segment
; ˼·���Ƚ�ffff:0��ֵ��ŵ�dx��
; 		֮����ѭ��������ffff:b~ffff:1��ֵ�ۼӵ�dx��
		mov ax,0ffffh
		mov ds,ax
		mov dh,0
		mov dl,ds:[0]
		
		mov ah,0
		mov cx,0bh; ����ѭ����cx��b��ʼ�ݼ�
add_label:
		mov bx,cx
		mov al,[bx]; ��ds:[b]~ds:[1]��ŵ�al
		add dx,ax
		loop add_label
		
		mov ax,4c00h
		int 21h
sg1 ends

end