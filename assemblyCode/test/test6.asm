; ��������ffff:0006���ֽڡ���Ԫ�е�������3������洢��dx��

assume cs:sg1

sg1 segment
; ˼·���Ƚ�ffff:0006�ֽڵ�Ԫ�е�ֵ����ax�У�����dx���ۼ�3��
		mov ax,0ffffh
		mov ds,ax
		mov bx,0006h; ��ʱ��ds:[bx]��Ӧffff:0006
		
		; ע�⣺��1�ֽڵ�ֵ����ax����Ҫ����ֵ�ŵ�al������ah��Ϊ0
		mov ah,0
		mov al,[bx]
		mov dx,0
		mov cx,3
add_label:
		add dx,ax
		loop add_label
		
		mov ax,4c00h
		int 21h
sg1 ends

end