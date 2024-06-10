dsg4 segment
    input_buffer db 101 dup (0) ; 100个字符的缓冲区 + 1个用于存储输入字符数  
    input_length db ?  
dsg4 ends
  
csg4 segment
		assume cs:csg4, ds:dsg4
start:
		mov ax, dsg4 
		mov ds, ax  
  
		; 设置输入缓冲区的大小
		mov byte ptr input_buffer, 100  
		lea si, input_buffer + 2 ; 跳过缓冲区开头的两个字节
  
		; 调用DOS中断0ah从键盘读取字符串  
		mov ah, 0ah  
		lea dx, input_buffer  
		int 21h  
  
		; 初始化计数器  
		xor bl, bl ; 小写字母计数  
		xor bh, bh ; 大写字母计数  
		xor dh, dh ; 数字计数  
		xor dl, dl ; 其他字符计数  
  
		; 跳过缓冲区开头的字符数
		mov cl, byte ptr [input_buffer + 1]  
		inc cl ; 因为字符数包括回车符，所以需要+1  
  
		; 遍历输入的字符  
		lea si, input_buffer + 2 ; 跳过字符数和回车符  
		dec cx ; 减去回车符  
  
char_loop:  
		; 加载当前字符  
		mov al, [si]  
  
		; 检查小写字母  
		cmp al, 'a'  
		jl not_lowercase  
		cmp al, 'z'  
		jg not_lowercase  
		inc bl  
		jmp next_char  
  
not_lowercase:  
		; 检查大写字母  
		cmp al, 'A'  
		jl not_uppercase  
		cmp al, 'Z'  
		jg not_uppercase  
		inc bh  
		jmp next_char  
  
not_uppercase:  
		; 检查数字  
		cmp al, '0'  
		jl not_digit  
		cmp al, '9'  
		jg not_digit  
		inc dh  
		jmp next_char  
  
not_digit:  
		; 其他字符  
		inc dl  
  
next_char:  
		inc si  
		loop char_loop  
  
    ; 退出程序  
		mov ah, 4ch  
		int 21h  
csg4 ends  
  
end start