%include "../LIB/pc_iox.inc"
N equ 10

global _start

section .data
tamano db 'Introdusca los valores del vector',0xa,0
inval db 'Invalido favor introducir otro caracter',0xa,0
fuera db 'El valor de N esta fuera del rango',0xa,0
section .bss
vector resb N
vector2 resb N

section .text
_start:
mov ecx,N
call Checkeo
cmp al,1
JE fin
mov edx,tamano
call puts
call CambioLinea
mov ebx,vector
call introduvector
mov edx,tamano
call puts
call CambioLinea
mov ebx,vector2
call introduvector
mov ebx,vector
mov edx,vector2
call SumaVector
call ProductoEscalarVector


fin:
xor ebx,ebx
mov eax,1
int 0x80  

Desplvector:
    push ecx
    push eax
    push esi
    continuo mov eax,[ebx+esi]
    inc esi
    call pHex_b
    call CambioLinea
    loop continuo
    pop esi
    pop eax
    pop ecx
    ret

CambioLinea:
    push eax
    mov al,10
    call putchar
    pop eax
ret

introduvector:
push ecx
push eax
push edx
push esi
cc:
captura  call getch
    cmp al,'0'
    JB invalido
    cmp al,'9'
    JA invalido
    sub eax,030h
    mov byte[ebx+esi],al
    inc esi
    jmp caminata
    invalido   mov edx,inval
    call puts
    jmp cc
    caminata:
   loop captura
   pop esi
   pop edx
   pop eax
   pop ecx
ret

    ;modifica el valor de al en caso de ser fuera de rango
Checkeo: 
    push ecx
    push edx
    cmp ecx,10
    JA xx
    cmp ecx,1
    JAE xxd
    xx:
    mov edx,fuera
    call puts
    call CambioLinea
    mov al,1
    xxd:
    pop edx
    pop ecx
ret

SumaVector:
    push ecx
    push ebx
    push edx
    push esi
    push eax
    sumando:
        mov byte al,edx[esi]
        add ebx[esi],al
        inc esi
    loop sumando
    pop eax
    pop esi
    pop edx
    pop ebx
    pop ecx
    call CambioLinea
    call Desplvector
ret

ProductoEscalarVector:
    push ecx
    push ebx
    push edx
    push esi
    push eax
    multiplicar:
    mov byte al,edx[esi]
    mul byte ebx[esi]
    mov byte ebx[esi],al
    inc esi
    loop multiplicar
    pop eax
    pop esi
    pop edx
    pop ebx
    pop ecx
    call CambioLinea
    call Escalar
    call CambioLinea
    
ret

Escalar:
    push ecx
    push ebx
    push esi
    sum:
    add al,ebx[esi]
    inc esi
    loop sum
    call pHex_b
    pop esi
    pop ebx
    pop ecx
ret