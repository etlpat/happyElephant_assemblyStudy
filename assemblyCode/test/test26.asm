; ������ʵ����ah=bh����ah=ah+ah������ah=ah+bh

assume cs:code

code segment
start:	mov ah,11h
		mov bh,45h
		
		cmp ah,bh
		je s1
		add ah,bh
		jmp short s2
s1:		add ah,ah

s2:		mov ax,4c00h
		int 21h
		
code ends

end start