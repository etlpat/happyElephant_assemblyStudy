dsg1 segment  
	x dw 2h
	y dw 1h
	z dw 3h
	max dw ?
dsg1 ends  

csg1 segment
		assume cs:csg1, ds:dsg1
start:	mov ax,dsg1
		mov ds,ax
	
		; 先比较x、y
		mov ax,x
		cmp ax,y
		jge s1; 若ax中值大，则跳到s1
		mov ax,y
  
		; 再将ax与z比较
s1:		cmp ax,z
		jge s2; 若ax中值大，则跳到s2
		mov ax,z
  
s2:		mov max,ax

		mov ax,4C00h
		int 21h  
csg1 ends 

end start