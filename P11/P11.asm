
extern putchar
global pBin8b
global pBin16b
global pBin32b
global pBin64b

section .text
myputchar:
push edx
push ecx
push eax
call putchar
pop eax
pop ecx
pop edx
ret

pBin8b:
push ebp 
mov ebp,esp 
mov dl,ebp[8]
mov ecx,8
rotar:
rol dl,1
JNC zer
mov al,'1'
jmp fff
zer mov al,'0'
fff:
call myputchar
loop rotar
pop ebp
ret

pBin16b:
push ebp
mov ebp,esp
mov dx,ebp[8]
mov ecx,16
rot:
rol dx,1
JNC impo
mov al,"1"
jmp fi
impo mov al,"0"
fi call myputchar
loop rot
pop ebp
ret

pBin32b:
push ebp
mov ebp,esp
mov edx,ebp[8]
mov ecx,32
ro:
rol edx,1
JNC iOO
mov al,"1"
jmp cfi
iOO mov al,"0"
cfi call myputchar
loop ro
pop ebp
ret

pBin64b:
push ebp
mov ebp, esp
push ebx
mov ebx,ebp[8]
mov edx,ebp[12]
mov ecx,32
primerparte:
rol edx,1
JNC cerro1
mov al,"1"
jmp fin1
cerro1 mov al,"0"
fin1 call myputchar
loop primerparte
mov ecx,32
segundaparte:
rol ebx,1
JNC cerro2
mov al,"1"
jmp fin2
cerro2 mov al,"0"
fin2 call myputchar
loop segundaparte
pop ebx
pop ebp
ret

