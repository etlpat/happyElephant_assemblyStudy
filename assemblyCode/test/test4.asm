; ���⣺����2��10�η��������AX��

assume cs:codesg1
codesg1 segment
		mov ax,2
		mov cx,9; ��ʼ��2^1�������2^10Ӧ��ѭ��9��
loop_lable:; ������
		add ax,ax
		loop loop_lable; CX--����CX��Ϊ0��������Ŵ�
		
		mov ax,4c00h
		int 21h
codesg1 ends
end