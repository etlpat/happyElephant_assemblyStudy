; ��������������8����ֵ�����ۼӣ��������ax��

assume ds:dsg,cs:csg

dsg segment
	; ��dsg���ж���һ�����8�����ݵ�����
	arr1 dw 123h,456h,789h,0abch,0defh,0fedh,0cbah,0987h
dsg ends

csg segment
start:	
		mov ax,dsg; ��dsg�ε�ַ����ds
		mov ds,ax
		
		mov ax,0; ���ڼ�¼�ۼ�����
		mov bx,0; ���ڼ�¼����Ԫ����Ե�ַ
		mov cx,8; ���ڼ�¼ѭ������
s:		
		add ax,[arr1+bx]
		add bx,2; ÿ��ѭ��bx+=2��ָ����һ��Ԫ��
		loop s
		
		mov ax,4c00h
		int 21h
csg ends

end start
