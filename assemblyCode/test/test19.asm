; 案例：将x/y，结果存入z中

assume ds:datasg,cs:codesg

datasg segment
	x dd 186a1h; 内存中为：a1 86 01 00
	y dw 64h; 内存中为：64 00
	z dw 0
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		mov dx,word ptr [x+2]; dx变为0001
		mov ax,word ptr [x]; ax变为86a1
		div word ptr [y]; 用dx,ax中值除[y]，余数入dx，商入ax
		mov [z],ax

		mov ax,4c00h
		int 21h
codesg ends

end start