; 案例：将ffff:0006【字节】单元中的数乘以3，结果存储在dx中

assume cs:sg1

sg1 segment
; 思路：先将ffff:0006字节单元中的值存入ax中，再向dx中累加3次
		mov ax,0ffffh
		mov ds,ax
		mov bx,0006h; 此时，ds:[bx]对应ffff:0006
		
		; 注意：将1字节的值放入ax，需要将该值放到al，并将ah赋为0
		mov ah,0
		mov al,[bx]
		mov dx,0
		mov cx,3
add_label:
		add dx,ax
		loop add_label
		
		mov ax,4c00h
		int 21h
sg1 ends

end