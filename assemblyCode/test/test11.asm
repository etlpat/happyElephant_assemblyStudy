assume ds:datasg,ss:stacksg,cs:codesg

; 定义数据段
datasg segment
	arr dw 111h,222h,333h,444h,555h,666h,777h,888h
datasg ends


; 定义栈段
stacksg segment
	mystack dw 0,0,0,0,0,0,0,0
stacksg ends


; 定义代码段
codesg segment
start:	mov ax,datasg
		mov ds,ax; 将数据段地址赋给ds
		mov ax,stacksg
		mov ss,ax; 将栈段地址赋给ss

		; 代码段内容......
		
		mov ax,4c00h
		int 21h
codesg ends

end start