; �������üӷ�����123*236���������AX��

assume cs:codesg1

codesg1 segment
; ����123*236�����ǰ�236�ۼ�123�Σ�ѭ������Խ��Խ��
		mov ax,0
		mov bx,236
		mov cx,123
add_label:
		add ax,bx
		loop add_label
		
		mov ax,4c00h
		int 21h
codesg1 ends

end