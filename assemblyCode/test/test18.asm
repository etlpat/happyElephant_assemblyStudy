; 案例：请将数据段中全部字符串的小写字母转为大写

assume ds:datasg,cs:codesg,ss:stacksg

datasg segment
	db '!@abc          $'; 已知每个字符串固定16字节
	db '!@def          $'
	db '!@ghi          $'
	db '!@jkl          $'
	db '!@nmo          $'
datasg ends


stacksg segment
	db 0,0,0,0,0,0,0,0; 共8个字
stacksg ends


codesg segment
start:	mov ax,datasg
		mov ds,ax
		mov ax,stacksg
		mov ss,ax
		mov sp,16; sp指向栈底的下一位
		
		; 循环打印字符串的值
		mov cx,5
		mov dx,0
		mov ah,9
t1:		int 21h
		add dx,16
		loop t1
		
		; 注意：这里使用双层loop循环，由于内外层循环都把cx作为循环计数器，
		;		因此当设定内层循环次数前，要先把外层循环次数的cx入栈，再设定内层循环的cx值，
		;		当内层循环执行结束，再把外层的循环次数出栈到cx中。
		; 补充：若循环有多层，我们可以选择用栈来保存每层的循环次数
		;		栈的好处：①后进先出，符合循环的层次
		;				  ②栈在内存中，不需要占用宝贵的寄存器空间
		mov al,11011111b
		mov bx,0; bx用于存放字符串首地址
		mov cx,5; 外层循环执行5次
s1:; 外层循环标签
		push cx
		mov cx,3; 内层循环执行3次
		mov si,2; si用于存储要修改的字母下标
s2:; 内层循环标签
		and [bx+si],al; 小写变大写
		inc si
		loop s2
		pop cx
		add bx,16
		loop s1
		
		
		; 循环打印字符串的值
		mov cx,5
		mov dx,0
		mov ah,9
t2:		int 21h
		add dx,16
		loop t2
		
		mov ax,4c00h
		int 21h
codesg ends

end start