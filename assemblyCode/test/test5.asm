; 案例：用加法计算123*236，结果存入AX中

assume cs:codesg1

codesg1 segment
; 计算123*236，我们把236累加123次，循环次数越少越好
		mov ax,0
		mov bx,236
		mov cx,123
add_label:
		add ax,bx
		loop add_label
		
		mov ax,4c00h
		int 21h
codesg1 ends

end