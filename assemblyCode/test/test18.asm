; �������뽫���ݶ���ȫ���ַ�����Сд��ĸתΪ��д

assume ds:datasg,cs:codesg,ss:stacksg

datasg segment
	db '!@abc          $'; ��֪ÿ���ַ����̶�16�ֽ�
	db '!@def          $'
	db '!@ghi          $'
	db '!@jkl          $'
	db '!@nmo          $'
datasg ends


stacksg segment
	db 0,0,0,0,0,0,0,0; ��8����
stacksg ends


codesg segment
start:	mov ax,datasg
		mov ds,ax
		mov ax,stacksg
		mov ss,ax
		mov sp,16; spָ��ջ�׵���һλ
		
		; ѭ����ӡ�ַ�����ֵ
		mov cx,5
		mov dx,0
		mov ah,9
t1:		int 21h
		add dx,16
		loop t1
		
		; ע�⣺����ʹ��˫��loopѭ�������������ѭ������cx��Ϊѭ����������
		;		��˵��趨�ڲ�ѭ������ǰ��Ҫ�Ȱ����ѭ��������cx��ջ�����趨�ڲ�ѭ����cxֵ��
		;		���ڲ�ѭ��ִ�н������ٰ�����ѭ��������ջ��cx�С�
		; ���䣺��ѭ���ж�㣬���ǿ���ѡ����ջ������ÿ���ѭ������
		;		ջ�ĺô����ٺ���ȳ�������ѭ���Ĳ��
		;				  ��ջ���ڴ��У�����Ҫռ�ñ���ļĴ����ռ�
		mov al,11011111b
		mov bx,0; bx���ڴ���ַ����׵�ַ
		mov cx,5; ���ѭ��ִ��5��
s1:; ���ѭ����ǩ
		push cx
		mov cx,3; �ڲ�ѭ��ִ��3��
		mov si,2; si���ڴ洢Ҫ�޸ĵ���ĸ�±�
s2:; �ڲ�ѭ����ǩ
		and [bx+si],al; Сд���д
		inc si
		loop s2
		pop cx
		add bx,16
		loop s1
		
		
		; ѭ����ӡ�ַ�����ֵ
		mov cx,5
		mov dx,0
		mov ah,9
t2:		int 21h
		add dx,16
		loop t2
		
		mov ax,4c00h
		int 21h
codesg ends

end start