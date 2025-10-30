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

mov cx,-6
inaster inc cx
aster   mov ax,cx
mov edx,risco
call puts
inc cx
loope aster
mov cx,ax
loope inaster

mov eax, 1 ;system call number (sys_exit) -- fin del programa
int 0x80        ;call kernel

section .data
msg db 'Menor_que_m',0xa,0
fdr db 'Fuera_de_rango',0xa,0
N db 'Es_un_numero',0xa,0
L db 'Es_una_letra',0xa,0
risco db '*',0xa,0