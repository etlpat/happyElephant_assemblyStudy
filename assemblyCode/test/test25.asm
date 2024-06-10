; 案例：将内存中十六进制的数据按照十进制字符串存储并输出

assume ds:data,ss:stack,cs:code

data segment
	arr1 dw 12345,1145,1919,2226,31415
	arr2 db 5 dup(0,0,0,0,0,0,0,0)
	ten dw 10; 用16进制数除10，倒序排列余数就是10进制数
data ends


stack segment
	dw 8 dup (0)
stack ends


code segment
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov cx,5; cx记录循环次数
		mov si,offset arr1; 用si存放整型数组地址
		mov di,offset arr2; 用di存放字符串数组地址
s:		
		call conversion_string; 将16进制数存入字符串中
		add si,2
		add di,8
		loop s
			
		mov ax,4c00h
		int 21h
		
		
conversion_string: ; 子程序，将16进制数转换为字符串
		push cx
		mov bx,7; bx记录字符串元素下标
		mov ax,[si]; dx,ax记录被除数
		mov cx,ax
		jcxz s2; 若被除数为0，直接跳出循环
	s1:	
		mov dx,0; 已知被除数的dx均为0
		div word ptr [ten]; 被除数÷10
		add dx,'0'; 将余数+'0'转为对应的ascii码
		mov [di+bx],dl; ascii码入字符串
		dec bx
		mov cx,ax
		jcxz s2; 若被除数为0，直接跳出循环
		jmp short s1
	s2:
		pop cx
		ret
code ends

end start