; 案例：连续输出'a'到'z'


assume cs:code

code segment
		mov ah,2; 2号功能：输出dl中的ascii码
		mov dl,'a'
s:		int 21h
		inc dl
		cmp dl,'z'
		jbe s; 当dl<=z，跳到s标号
		
		mov ax,4c00h
		int 21h
code ends

end