; 案例：计算ffff:0~ffffb【字节】单元中的数据和，把结果存放在dx中

assume cs:sg1

sg1 segment
; 思路：先将ffff:0的值存放到dx中
; 		之后再循环，倒序将ffff:b~ffff:1的值累加到dx中
		mov ax,0ffffh
		mov ds,ax
		mov dh,0
		mov dl,ds:[0]
		
		mov ah,0
		mov cx,0bh; 进入循环，cx从b开始递减
add_label:
		mov bx,cx
		mov al,[bx]; 将ds:[b]~ds:[1]存放到al
		add dx,ax
		loop add_label
		
		mov ax,4c00h
		int 21h
sg1 ends

end