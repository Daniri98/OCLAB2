global suma
global strlenn
section .text

suma:
push ebp
mov ebp,esp
mov eax,[ebp+8]
add eax,[ebp+12]
pop ebp
ret

strlenn:
push ebp
mov ebp,esp
push ebx
push edx
mov eax,0
mov  edx,ebp[8]
contar:
mov byte bl,[edx]
cmp bl,0
JE No
inc eax
inc edx
jmp contar
No:
pop edx
pop ebx
pop ebp
ret