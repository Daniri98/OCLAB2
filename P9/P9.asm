%include "../LIB/libpc_iox.a"
global _start
section .data
vector db 12345
section .dss


section .text



mov eax, 1 
int 0x80  

