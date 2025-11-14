%include "../LIB/pc_iox.inc"
extern pBin_n
extern pBin_b
extern pBin_w
extern pBin_dw
N equ 2
global _start
section .data
cadena db "Camarones frescos",0x0a,0
fuera db "Esta fuera del rango establecido 0 o 7",0xa,0


section .text
_start:
mov ebx,cadena
call PrintStr
call CambioLinea
call InvertirStr
call CambioLinea
mov cl,N
call TestBit
call CambioLinea
mov edx,55
call Espar
call CambioLinea

mov ax,1
int 0x80

PrintStr:
    push ebx
    push eax
    desplegue:
    mov byte al,[ebx]
    cmp al,0
    JE terminodesp
    call putchar
    inc ebx
    jmp desplegue
    terminodesp:
    pop eax
    pop ebx
ret
CambioLinea:
    push eax
    mov al,10
    call putchar
    pop eax
ret
InvertirStr:
    push ebx
    push eax
    push ecx
    mov ecx,1
    contar:
    mov byte al,[ebx]
    cmp al,0
    JE despinver
    inc ebx
    inc ecx
    jmp contar
    despinver:
        mov byte al,[ebx]
        dec ebx
        call putchar
    loop despinver
    pop ecx
    pop eax
    pop ebx
ret

TestBit:
    push edx
    cmp cl,0
    JB estaf
    cmp cl,7
    JNA conti
    estaf:
    mov edx, fuera
    call puts
    jmp ff
    conti:
    push ecx
    push eax
    inc ecx         ;inc a ecx porque al usar ror no puedo hacer 0 rotaciones
    mov al,0F4h
    call pBin_b
    call CambioLinea
    ror al,cl
    LAHF
    mov al,ah
    call pBin_n
    pop eax
    pop ecx
    ff:
    pop edx
ret
Espar:
    push edx
    push ebx
    mov eax,edx
    xor edx,edx ;limpiado para que puede guardar el valor de la division
    mov ebx,2
    div ebx
    cmp edx,0
    JNE impar
    mov al,'1'
    jmp finale
    impar:
    mov al,'0'
    finale:
    call putchar
    pop ebx
    pop edx
ret