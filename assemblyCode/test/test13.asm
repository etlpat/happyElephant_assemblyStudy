; ������arr1��arr2��arr3�Ƿֱ�λ��3�����е�����
;		��arr1��arr2�����Ӧλ��Ԫ����ӣ��������arr3��

assume cs:csg,ds:sg1

sg1 segment
	arr1 dw 1,2,3,4,5,6,7,8
sg1 ends

sg2 segment
	arr2 dw 8,7,6,5,4,3,2,1
sg2 ends

sg3 segment
	arr3 dw 0,0,0,0,0,0,0,0
sg3 ends


csg segment
start:	mov dx,sg1; dx���ڴ�Ŷε�ַ
		mov ds,dx
		mov cx,8; cx���ڱ�ʾѭ������
		mov bx,0; bx���ڼ�¼����Ԫ�ص�ַ
		
s:		mov dx,sg2
		mov es,dx
		mov ax,es:[arr2+bx]; ax���ڴ������֮��
		add ax,[arr1+bx]
		mov dx,sg3
		mov es,dx
		mov es:[arr3+bx],ax
		add bx,2
		loop s
		
		mov ax,4c00h
		int 21h
csg ends

end start
