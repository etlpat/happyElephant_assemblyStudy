assume cs:code

code segment
start:
		; 调用1号功能，获取键盘输入的字符（存入al中）
		mov ah,01h
		int 21h		
		mov dl,al; dl存放获取字符的ascii码

		; 处理小写字符
		cmp dl,'z'
		ja s3
		cmp dl,'a'
		jb s1
		and dl,11011111b; 小写转大写
		jmp short s2

s1:		; 处理大写字符
		cmp dl,'Z'
		ja s3
		cmp dl,'A'
		jb s3
		or dl,00100000b; 大写转小写
		
s2:		; 调用2号功能，输出转变大小写后的字符
		mov ah,02h
		int 21h

s3:		; 退出程序
		mov ax,4c00h
		int 21h
code ends

end start