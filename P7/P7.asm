%include "../LIB/pc_iox.inc"

extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    mov eax,0x22446688
    ror eax,4
    call pHex_dw
    mov al,10	; cambio de linea
	call putchar

    mov cx,0x3F48
    shl cx,3
    shr cx,1
    shl ch,1
    shl cl,1
    mov ax,cx
    call pHex_w
    mov al,10	; cambio de linea
	call putchar

    mov esi,0x20D685F4
    mov eax, esi
    call pBin_dw
    mov al,10	; cambio de linea
	call putchar
    mov eax,0x40042021
    xor esi,eax
    mov eax,esi
    call pBin_dw
    mov al,10	; cambio de linea
	call putchar

    mov eax,esp
    call pHex_dw
    push esi
    mov al,10	; cambio de linea
	call putchar
     mov eax,esp
    call pHex_dw
    mov al,10	; cambio de linea
	call putchar

    mov ch,0xA7
    mov al,ch
    call pBin_b
    mov al,10	; cambio de linea
	call putchar
    mov al,0x48
    or ch,al
    mov al,ch
    call pBin_b
    mov al,10	; cambio de linea
	call putchar
    
    mov bp, 0x67DA
    mov ax,bp
    call pBin_w
    mov al,10	; cambio de linea
	call putchar
    mov ax,0x2388
    and bp,ax
    mov ax,bp
    call pBin_w
    mov al,10	; cambio de linea
	call putchar
    
    shr bp,3
    mov ax,bp
    call pBin_w
    mov al,10	; cambio de linea
	call putchar

    mov ebx,0x0F2A2388
    mov eax, ebx
    call pBin_dw
    mov al,10	; cambio de linea
	call putchar
    shr ebx,5
    mov eax,ebx
    call pBin_dw
    mov al,10	; cambio de linea
	call putchar

    mov ax,cx
    call pBin_w
    mov al,10	; cambio de linea
	call putchar
    shl cx,3
    mov ax,cx
    call pBin_w
    mov al,10	; cambio de linea
	call putchar

    mov eax,esp
    call pHex_dw
    pop esi
    mov al,10	; cambio de linea
	call putchar
    mov eax,esp
    call pHex_dw
    mov al,10	; cambio de linea
	call putchar

    mov eax,esi
    call pBin_dw
    mov al,10	; cambio de linea
    call putchar
    mov eax,esi  
    mov ebx,esi 
    shl eax,3
    shl ebx,1
    add eax,ebx
    call pBin_dw
    mov al,10	; cambio de linea
    call putchar 
    
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel