%include "../LIB/pc_iox.inc"
N equ 10

global _start

section .data
tamano db 'Introdusca los valores del vector',0xa,0
inval db 'Invalido favor introducir otro caracter',0xa,0
section .bss
vector resb N

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
    sub eax,030h
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
cc:
captura  call getch
    cmp al,'0'
    JB invalido
    cmp al,'9'
    JA invalido
    mov byte[ebx+ecx-1],al
    jmp caminata
    invalido    push edx
    mov edx,inval
    call puts
    pop edx
    jmp cc
    caminata:
   loop captura
   mov ecx,edx
ret