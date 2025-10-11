%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start: 
    mov ebx,9
    mov esi,5    
    mov byte [msg+ebx+esi*2],'%'              
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	mov ebx,0			; establecimiento a 0 para que tenga una salida exitosa y no marque 
						; como fallo por tener a ebx con un valor diferente
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 