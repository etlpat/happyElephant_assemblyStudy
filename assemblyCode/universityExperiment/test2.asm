assume ds:data,cs:code

data segment
	score db 77,82,65,94,76,88,83,98,65,72
	max db ?
data ends

code segment
start:	mov ax,data
		mov ds,ax
		
		mov al,[score]; al存放已遍历的学生成绩的最大值
		mov si,offset score + 1; si初始指向第二个学生
		mov cx,9; 循环9次
s1:
		cmp al,[si]
		jge s2; 若al>=[si]则跳到s2
		mov al,[si]
s2:		inc si
		loop s1
		
		mov [max],al
		
		mov ax,4c00h
		int 21h
code ends

end start