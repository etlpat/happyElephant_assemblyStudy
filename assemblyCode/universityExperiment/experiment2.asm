dsg2 segment  
scores DB 85,92,78,90,88,76,95,89,93,87; 定义10个任意成绩 
MAX DB ?
dsg2 ends

csg2 segment
		assume cs:csg2, ds:dsg2
start:	mov ax,dsg2
		mov ds,ax
		
		mov si, offset scores; 用si指向scores的首地址
		mov al,0; 用al存放已知成绩的最大值
		mov cx,10; 循环10次
		
loop_label:
		mov bl,[si]
		cmp al,bl
		jge s; 若al的成绩大，跳转到s标号
		mov al,bl
s:		inc si; si自增，指向下一个成绩
		loop loop_label
		
		mov max,al;最终al存放最大值
		
		mov ax,4c00h
		int 21h
csg2 ends 

end start