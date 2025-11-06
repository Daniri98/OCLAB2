%include "../LIB/pc_iox.inc"

section	.text
global _start 

_start: 
call getche 
cmp al,'a'
JB  fuera
cmp al,'z'
JA fuera
cmp al,'m'
JAE nada
JB menor

fuera mov edx,fdr
jmp terminar

menor mov edx,msg
terminar mov al,10
call putchar
call puts 

nada mov al,10
call putchar
call getche 
cmp al,'0'
JB fran
cmp al,'9'
JA CLetra
JBE Numero
CLetra cmp al,'A'
JB  fran
cmp al,'Z'
JA  fran
JBE Letra
fran mov edx,fdr
jmp term
Numero mov edx,N
jmp term
Letra mov edx,L
term mov al,10
call putchar
call puts

mov al,10
call putchar

mov cx,6
inaster mov bx,cx
aster  mov al,[risco] 
call putchar
loop aster
mov al,10
call putchar
mov cx,bx
loop inaster

mov cx,10
mov edx,Arreglo
captura call getch
mov  [edx+ecx-1],al
loop captura

mov edx,orden
mov al,10
call putchar
call puts 


mov cx,10
mov edx,Arreglo
despli mov  Al,[edx+ecx-1]
call  putchar
mov al,10
call putchar
loop despli

xor ebx,ebx

mov eax, 1 ;system call number (sys_exit) -- fin del programa
int 0x80        ;call kernel

section .data
msg db 'Menor que m',0xa,0
fdr db 'Fuera de rango',0xa,0
N db 'Es un numero',0xa,0
L db 'Es una letra',0xa,0
orden db 'Datos capturados',0xa,0
risco db '*'

section .bss
Arreglo resb 10