assume cs:csg3

csg3 segment  
start:	mov ah,1h
		int 21h; 从键盘读取字符，存入al中
  
		; 检查是否为小写字母
		cmp al,'a'
		jl not_lowercase
		cmp al,'z'
		jg not_letter
		
		; 已知是小写字母，转换为大写
		sub al,20h
		jmp output

		; 检查是否为大写字母
not_lowercase:
		cmp al,'A'
		jl not_letter
		cmp al,'Z'
		jg not_letter
		
		; 已知是大写字母，转换为小写
		add al,20h

output:	; 输出转换后的字母
		mov dl,al
		mov ah,2h
		int 21h
  
not_letter:; 退出程序
		mov ah, 4ch
		int 21h
csg3 ends

end start