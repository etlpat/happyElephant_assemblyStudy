dsg4 segment
    input_buffer db 101 dup (0) ; 100���ַ��Ļ����� + 1�����ڴ洢�����ַ���  
    input_length db ?  
dsg4 ends
  
csg4 segment
		assume cs:csg4, ds:dsg4
start:
		mov ax, dsg4 
		mov ds, ax  
  
		; �������뻺�����Ĵ�С
		mov byte ptr input_buffer, 100  
		lea si, input_buffer + 2 ; ������������ͷ�������ֽ�
  
		; ����DOS�ж�0ah�Ӽ��̶�ȡ�ַ���  
		mov ah, 0ah  
		lea dx, input_buffer  
		int 21h  
  
		; ��ʼ��������  
		xor bl, bl ; Сд��ĸ����  
		xor bh, bh ; ��д��ĸ����  
		xor dh, dh ; ���ּ���  
		xor dl, dl ; �����ַ�����  
  
		; ������������ͷ���ַ���
		mov cl, byte ptr [input_buffer + 1]  
		inc cl ; ��Ϊ�ַ��������س�����������Ҫ+1  
  
		; ����������ַ�  
		lea si, input_buffer + 2 ; �����ַ����ͻس���  
		dec cx ; ��ȥ�س���  
  
char_loop:  
		; ���ص�ǰ�ַ�  
		mov al, [si]  
  
		; ���Сд��ĸ  
		cmp al, 'a'  
		jl not_lowercase  
		cmp al, 'z'  
		jg not_lowercase  
		inc bl  
		jmp next_char  
  
not_lowercase:  
		; ����д��ĸ  
		cmp al, 'A'  
		jl not_uppercase  
		cmp al, 'Z'  
		jg not_uppercase  
		inc bh  
		jmp next_char  
  
not_uppercase:  
		; �������  
		cmp al, '0'  
		jl not_digit  
		cmp al, '9'  
		jg not_digit  
		inc dh  
		jmp next_char  
  
not_digit:  
		; �����ַ�  
		inc dl  
  
next_char:  
		inc si  
		loop char_loop  
  
    ; �˳�����  
		mov ah, 4ch  
		int 21h  
csg4 ends  
  
end start