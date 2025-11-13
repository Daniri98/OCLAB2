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
push ecx
push ebx
push esi
mov ecx,20
mov eax,0
contar:
mov byte bl,ebp[20+esi]
cmp bl,0
JE No
inc eax
dec esi
loop contar
No:
pop esi
pop ebx
pop ecx
pop ebp
ret