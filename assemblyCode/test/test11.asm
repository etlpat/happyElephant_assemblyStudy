assume ds:datasg,ss:stacksg,cs:codesg

; �������ݶ�
datasg segment
	arr dw 111h,222h,333h,444h,555h,666h,777h,888h
datasg ends


; ����ջ��
stacksg segment
	mystack dw 0,0,0,0,0,0,0,0
stacksg ends


; ��������
codesg segment
start:	mov ax,datasg
		mov ds,ax; �����ݶε�ַ����ds
		mov ax,stacksg
		mov ss,ax; ��ջ�ε�ַ����ss

		; ���������......
		
		mov ax,4c00h
		int 21h
codesg ends

end start