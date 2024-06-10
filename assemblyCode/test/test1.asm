assume cs: mySegment1

mySegment1 segment
	mov ax, 2
	add ax, ax
	add ax, ax

	; 将程序返回
	mov ax, 4c00h	;h表示是16进制数
	int 21h

mySegment1 ends

end