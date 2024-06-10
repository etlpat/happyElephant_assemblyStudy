assume ds:data,cs:code

data segment
	buf db 'a','b','c','d','e','z','f','g','h','i'
	max db ?
data ends


code segment
start:	mov ax,data
		mov ds,ax
		
		mov al,0; al用于存放已经遍历过的最大值
		mov si,offset buf; si存放首地址
		mov cx,10; cx存放循环次数
		
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