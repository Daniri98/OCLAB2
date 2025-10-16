%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    mov ebx, 0x5C4B2A60
    add ebx, 0x2220359
    mov eax,ebx
    call pHex_dw
    mov al,10	; cambio de linea
	call putchar
    mov ax,sp
    call pHex_w
    mov al,10	; cambio de linea
	call putchar
    push  bx
    mov ax,sp
    call pHex_w
    mov al,10	; cambio de linea
	call putchar
    mov al,[N]
    mul bl
    mov [N],ax
    inc word [N]
    call pHex_w
    mov al,10	; cambio de linea
	call putchar


	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel
    section	.data
    N dw 8