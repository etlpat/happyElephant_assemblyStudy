assume ds:data,cs:code

data segment
	buf db 12 dup(0)
	max db ?
data ends


code segment
start:	mov ax,data
		mov ds,ax
		
		; 调用10号功能从屏幕输入字符串
		mov [buf],10
		mov ah,10
		mov dx,offset buf
		int 21h
		
		mov al,[buf+2]; al用于存放已经遍历过的最大值
		mov si,offset buf + 3
		mov ch,0
		mov cl,[buf+1]; cx表示循环次数
		dec cx
		
s:		; 进入循环
		cmp al,[si]
		jae s1
		mov al,[si]; 保证al一直是最大值
s1:		
		inc si
		loop s
		; loop功能：
		; ①cx--
		; ②判断cx值，若不为0，跳到s（标号）
		;			 若为0，向后执行
		
		
		; 循环结束，al中为ascii最大值
		mov [max],al
		
		
		; 调用2号功能，打印max中的字符到屏幕
		mov ah,2
		mov dl,[max]
		int 21h
		
		; 退出程序
		mov ax,4c00h
		int 21h
code ends

end start