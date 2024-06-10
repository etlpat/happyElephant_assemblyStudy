; 案例：将ffff:0~ffff:f段空间的值拷贝到20:0~20:f中

assume cs:sg1
sg1 segment
; 思路：本题中涉及到了两个段，用一个ds不好描述
; 		那么，我们可以利用拓展段es，并搭配段前缀，增加一个可使用的段
		mov ax,20h
		mov ds,ax
		mov ax,0ffffh
		mov es,ax
		
		mov bx,0
		mov cx,10h
add_label:
		mov al,es:[bx]; 先将ffff:[bx]的值给到al
		mov [bx],al; 再将al的值给到20:[bx]
		inc bx; bx自增1
		loop add_label
		
		mov ax,4c00h
		int 21h
sg1 ends
end