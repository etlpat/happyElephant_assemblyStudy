assume cs:codesg1

codesg1 segment

	mov ax,2000h
	mov ds,ax; ����ds
	mov ax,0ffffh
	mov ds:[0],ax
	mov ds:[2],ax; ��[0]~[3]��Ϊȫf
	
	; ʹ��debug�鿴MASM��[0]��ds:[0]�÷�������
	mov ah,[0]
	mov al,ds:[0]
	mov bh,[1]
	mov bl,ds:[1]
	mov ch,[2]
	mov cl,ds:[2]
	mov dh,[3]
	mov dl,ds:[3]
	; MASM�����������[����]�������е����ִ���
	; �����ʾ�洢��ֱ��Ѱַ����Ҫ���ds��ǰ׺����ds:[����]
	
	;mov [1],ax; ����[1]������������
	mov ds:[1],ax
	
	mov ax,4c00h
	int 21h

codesg1 ends

end