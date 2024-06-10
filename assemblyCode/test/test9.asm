assume ds:data,cs:code

data segment
	x db 11h
	y db 22h
	z db 33h
	arr1 db 44h,55h,66h,77h
	x1 dw 0111h
	y1 dw 0222h
	z1 dw 0333h
	arr2 dw 0444h,0555h,0666h,0777h
data ends

code segment

s:	mov ax,data
	mov ds,ax
	
	mov bl,x
	mov bl,y
	mov bl,z
	mov bl,arr1
	mov bl,arr1+1
	mov bl,arr1+2
	mov bl,arr1+3
	mov bx,x1
	mov bx,y1
	mov bx,z1
	mov bx,arr2
	mov bx,arr2+2
	mov bx,arr2+4
	mov bx,arr2+6
	
	mov bl,[x]
	mov bl,[y]
	mov bl,[z]
	mov bl,[arr1]
	mov bl,[arr1+1]
	mov bl,[arr1+2]
	mov bl,[arr1+3]
	mov bx,[x1]
	mov bx,[y1]
	mov bx,[z1]
	mov bx,[arr2]
	mov bx,[arr2+2]
	mov bx,[arr2+4]
	mov bx,[arr2+6]
	
	MOV CL,Y
	MOV CL,Y+1
	MOV CL,Y+2	
	MOV CL,[Y+1]
	MOV CL,[Y+2]	
	MOV CX,Y1
	MOV CX,Y1+2
	MOV CX,Y1+4	
	MOV CX,[Y1+2]
	MOV CX,[Y1+4]
	
	
	mov ax,4c00h
	int 21h

code ends

end s