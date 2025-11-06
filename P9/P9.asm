%include "../LIB/pc_iox.inc"
N equ 10

global _start

section .data
tamano db 'Defina el tamano de su vector',0xa,0
inval db 'Invalido favor introducir otro caracter',0xa,0
section .bss
xdd resb N

section .text
_start:
mov edx,tamano
call puts
call CambioLinea
mov ecx,N
mov ebx,vector
call introduvector
call Desplvector

mov eax,1
int 0x80  

Desplvector:
    mov edx,ecx
    continuo mov eax,[ebx+ecx-1]
    call pHex_b
    call CambioLinea
    loop continuo
    mov ecx,edx
    ret

CambioLinea:
    push eax
    mov al,10
    call putchar
    pop eax
ret

introduvector:
mov edx,ecx
captura  call getch
    cmp '0'
    JB
    cmp'9'
    JA invalido
    mov byte
    push edx
    invalido mov edx,inval
    call puts
    pop edx
    loop captura
ret