; 例题：计算2的10次方，存放在AX中

assume cs:codesg1
codesg1 segment
		mov ax,2
		mov cx,9; 初始是2^1，则计算2^10应该循环9次
loop_lable:; 定义标号
		add ax,ax
		loop loop_lable; CX--，若CX不为0则跳到标号处
		
		mov ax,4c00h
		int 21h
codesg1 ends
end