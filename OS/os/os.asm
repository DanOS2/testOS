section .text
	use16
	org  0x7C00
start:
	mov  ax, cs
	mov  ds, ax
	mov ax, 0002h
	int 10h
	mov ah, 0x0E
	mov al, 'W'
	int 10h
	mov ah, 0x0E
	mov al, 'e'
	int 10h
	mov ah, 0x0E
	mov al, 'l'
	int 10h
	mov ah, 0x0E
	mov al, 'c'
	int 10h
	mov ah, 0x0E
	mov al, 'o'
	int 10h
	mov ah, 0x0E
	mov al, 'm'
	int 10h
	mov ah, 0x0E
	mov al, 'e'
	int 10h
	mov ah, 0x0E
	mov al, ' '
	int 10h
	mov ah, 0x0E
	mov al, 't'
	int 10h
	mov ah, 0x0E
	mov al, 'o'
	int 10h
	mov ah, 0x0E
	mov al, ' '
	int 10h
	mov ah, 0x0E
	mov al, 'P'
	int 10h
	mov ah, 0x0E
	mov al, 'y'
	int 10h
	mov ah, 0x0E
	mov al, 'O'
	int 10h
	mov ah, 0x0E
	mov al, 'S'
	int 10h
	mov ah, 0x0E
	mov al, 13
	int 10h
	mov ah, 0x0E
	mov al, 10
	int 10h
	mov ah, 0x0E
	mov al, '$'
	int 10h
	mov ah, 0x0E
	mov al, ' '
	int 10h
	jmp GetText
	; ====== Проверка для клавиш ======
	NewLine:
		mov ah, 0x0E
		mov al, 13
		int 10h
		mov ah, 0x0E
		mov al, 10
		int 10h
		mov ah, 0x0E
		mov al, '$'
		int 10h
		mov ah, 0x0E
		mov al, ' '
		int 10h
	BackSpace:
		mov ah, 0x0E
		mov al, ''
		int 10h
		mov ah, 0x0E
		mov al, 8
		int 10h
	; ====== Ввод символов ======
	GetText:
		mov ah,0 ; ждем нажатия клавиши
		int 16h
		mov ah, 0x0e
		int 10h
		int 16h
		cmp al,13 		; \ если нажат enter
		jz NewLine 		; / Перейти перенести строку
		cmp al,8 		; \ если нажат backspace
		jz BackSpace 		; / Стереть символ

	jmp GetText
	buffer db '', 0
puts_loop_exit:
	jmp  $
finish:
	times 0x1FE-finish+start db 0
	db   0x55, 0xAA