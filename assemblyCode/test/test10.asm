; 案例：将给定的8个数值进行累加，结果存入ax中

assume ds:dsg,cs:csg

dsg segment
	; 在dsg段中定义一个存放8个数据的数组
	arr1 dw 123h,456h,789h,0abch,0defh,0fedh,0cbah,0987h
dsg ends

csg segment
start:	
		mov ax,dsg; 把dsg段地址赋给ds
		mov ds,ax
		
		mov ax,0; 用于记录累加数据
		mov bx,0; 用于记录数组元素相对地址
		mov cx,8; 用于记录循环次数
s:		
		add ax,[arr1+bx]
		add bx,2; 每次循环bx+=2，指向下一个元素
		loop s
		
		mov ax,4c00h
		int 21h
csg ends

end start
