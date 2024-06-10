assume ds:data,cs:code

data segment
	buffer db 102 dup(0)
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		; 调用10号功能输入字符串
		mov [buffer],100; buffer的第一个字节存放最大字符数
		mov ah,10
		mov dx,offset buffer
		int 21h
		; 10号功能结束后：
		; 字符串的第一个字节存放最大字符个数
		; 字符串的第二个字节存放实际的字符个数（不包括回车）
		; 从第三个字节开始，存放输入的字符串
		
		mov si,offset buffer+2; si存放字符首地址
		mov ch,0
		mov cl,[buffer+1]; cx存放实际字符个数
		mov bl,0; bl存放小写字母个数
		mov bh,0; bh存放大写字母个数
		mov dh,0; dh存放数字个数
		mov dl,0; dl存放其它字符个数
		
		
s:		; 开始循环
		mov al,[si]; al存放字符串中的每个字符
		; 判断是否为小写字母
		cmp al,'z'
		ja s3
		cmp al,'a'
		jb s1
		inc bl
		jmp short s4
s1:		; 判断是否为大写字母
		cmp al,'Z'
		ja s3
		cmp al,'A'
		jb s2
		inc bh
		jmp short s4
s2:		; 判断是否为数字
		cmp al,'9'
		ja s3
		cmp al,'0'
		jb s3
		inc dh
		jmp short s4
s3:		; 其它字符
		inc dl
s4:		; 本次判断结束
		inc si
		loop s

		
		mov ax,4c00h
		int 21h
code ends

end start
