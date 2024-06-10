; 案例：书本p172页实验7

assume ds:data,cs:code,es:table

data segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	;以上是表示21年的21个字符串（首地址：0）
	
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	;以上是表示21年公司总收入的21个dword型数据（首地址：84）
	
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11542,14430,15257,17800
	;以上是表示21年公司雇员人数的21个word型数据（首地址：168）
data ends


table segment
	db 21 dup('year summ ne ?? ')
	; 以上是存放21行表格数据的空间（偏移地址：0、5、10、13）
table ends


code segment
start:	mov ax,data
		mov ds,ax
		mov ax,table
		mov es,ax
		
		mov cx,21
		mov si,0
		mov bx,0
		mov di,0; 存放表元组首地址
		
		; 思路：由于年份和收入的地址每次循环需要递增4，而人数地址每次递增2
		;		因此，这里我们每次循环将si、bx各递增2，(si+bx)总体就递增了4
		;		这样可以用(si+bx)作为年份、收入的地址增量，把bx或si作为人数的地址增量
	
s:		; 年份入表
		mov ax,[0+bx+si]; 前两字符入表
		mov es:[di+0],ax
		mov ax,[0+bx+si+2]; 后两字符入表
		mov es:[di+2],ax
		; 总收入入表
		mov ax,[84+bx+si]; 前两字节入表
		mov es:[di+5],ax
		mov ax,[84+bx+si+2]; 后两字节入表
		mov es:[di+7],ax
		; 总人数入表
		mov ax,[168+bx]
		mov es:[di+10],ax
		; 计算平均工作
		mov dx,es:[di+7]
		mov ax,es:[di+5]
		div word ptr es:[di+10]
		mov es:[di+13],ax
		; 改变循环变量
		add si,2
		add bx,2
		add di,16
		loop s
		
		mov ax,4c00h
		int 21h
code ends

end start