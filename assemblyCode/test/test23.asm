; 案例：计算数据段中第一组数据的三次方，将结果存入第二组数据单元中
;		注意：用子程序封装计算x^3

assume ds:data,cs:code,ss:stack

data segment
	arr1 dw 1,2,3,4,5,6,7,8
	arr2 dd 8 dup(0)
data ends


stack segment
	dw 8 dup(0)
stack ends


code segment
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov cx,8
		mov si,0
		mov di,0
s:		
		mov bx,[arr1+si]; bx保存要计算三次方的数据
		call third_power
		; 子程序的ret返回此处，此时计算结果在dx,ax中
		mov word ptr [arr2+di],ax
		mov word ptr [arr2+di+2],dx
		add si,2
		add di,4
		loop s
		
		mov ax,4c00h
		int 21h
		
		
; 计算bx三次方的子程序，最终结果存在dx,ax中
third_power:
		mov ax,bx
		mul bx
		mul bx;
		ret
code ends

end start
