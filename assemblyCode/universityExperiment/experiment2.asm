dsg2 segment  
scores DB 85,92,78,90,88,76,95,89,93,87; ����10������ɼ� 
MAX DB ?
dsg2 ends

csg2 segment
		assume cs:csg2, ds:dsg2
start:	mov ax,dsg2
		mov ds,ax
		
		mov si, offset scores; ��siָ��scores���׵�ַ
		mov al,0; ��al�����֪�ɼ������ֵ
		mov cx,10; ѭ��10��
		
loop_label:
		mov bl,[si]
		cmp al,bl
		jge s; ��al�ĳɼ�����ת��s���
		mov al,bl
s:		inc si; si������ָ����һ���ɼ�
		loop loop_label
		
		mov max,al;����al������ֵ
		
		mov ax,4c00h
		int 21h
csg2 ends 

end start