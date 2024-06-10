assume ds:datasg,cs:codesg

datasg segment
	mychar1 db 'a'
datasg ends

codesg segment
start:	mov ax,datasg
		mov ds,ax
		
		mov ah,02h
		mov dl,[mychar1]; 把'a'的ASCII码值传入dl
		int 21h
	
		mov ax,4c00h
		int 21h
codesg ends

end start