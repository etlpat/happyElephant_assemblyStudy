assume cs:csg3

csg3 segment  
start:	mov ah,1h
		int 21h; �Ӽ��̶�ȡ�ַ�������al��
  
		; ����Ƿ�ΪСд��ĸ
		cmp al,'a'
		jl not_lowercase
		cmp al,'z'
		jg not_letter
		
		; ��֪��Сд��ĸ��ת��Ϊ��д
		sub al,20h
		jmp output

		; ����Ƿ�Ϊ��д��ĸ
not_lowercase:
		cmp al,'A'
		jl not_letter
		cmp al,'Z'
		jg not_letter
		
		; ��֪�Ǵ�д��ĸ��ת��ΪСд
		add al,20h

output:	; ���ת�������ĸ
		mov dl,al
		mov ah,2h
		int 21h
  
not_letter:; �˳�����
		mov ah, 4ch
		int 21h
csg3 ends

end start