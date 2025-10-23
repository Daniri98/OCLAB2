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

    mov ax,sp           ;mover a donde esta apuntando el stack pointer a AX
    call pHex_w         ;Desplegar el valor inicial de sp
    mov al,10	; cambio de linea
	call putchar

    push bx              ; insertar los datos de 16 menos significativos de EBX
    mov ax,sp            ; mover a donde esta apuntando SP a AX
    call pHex_w          ;Desplegar en donde estaba apuntando
    mov al,10	; cambio de linea
	call putchar
    
    mov al,[N]          ;mover el valor encontrado en el lugar de memoria de la etiqueta N a AL
    mul bl              ;multiplicar AL por lo que se encuentra en BL
    mov [N],ax          ;mover el resultado al lugar de memoria de la etiqueta N
    call pHex_w         ;Desplegar el resultado
    mov al,10	; cambio de linea
	call putchar

    inc word [N]         ;Incrementar en 1 el valor encontrado en el lugar de memoria de N
    mov ax,[N]           ;Mover el valor incrementado a ax
    call pHex_w          ;Despliegue del valor aumentado
    mov al,10	; cambio de linea
	call putchar

    mov ax,bx           ;mover el valor del registro bx a ax para poder dividirlo
    mov cx, 0xFF        ;darle el valor de 0xFF al divisor
    div cx              ; dividir ax con cx
    call pHex_w         ; despliegue del cociente de la division
    mov al,10	; cambio de linea
	call putchar
    mov ax,dx           ;mover el valor del residuo a ax 
    call pHex_w         ;despliegue del valor del residuo
    mov al,10	; cambio de linea
	call putchar

    mov ax,[N]
    add ax,dx
    call pHex_w  
    mov [N],ax
    mov al,10	; cambio de linea
	call putchar

    dec word [N]
    pushfd
    pop eax
    call pHex_dw 
    mov al,10	; cambio de linea
	call putchar
    
    mov ax,sp           ;mover a donde esta apuntando el stack pointer a AX
    call pHex_w         ;Desplegar el valor inicial de sp
    mov al,10	; cambio de linea
	call putchar
    pop ax                  ;remover un dato de 16 bits de la pila
    
    mov ax,sp           ;mover a donde esta apuntando el stack pointer a AX
    call pHex_w         ;Desplegar el valor final de sp
    mov al,10	; cambio de linea
	call putchar

    xor ebx,ebx         ; establecimiento a 0 para que tenga una salida exitosa y no marque 
						; como fallo por tener a ebx con un valor diferente
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel
    section	.data
    N dw 8