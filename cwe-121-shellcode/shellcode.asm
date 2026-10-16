section .text
global _start
_start:
    jmp short dummy
imprimir_str:
    pop ecx                 ; direccion de "ganaste guillermo!"
    mov al,4                ; syscall write: #4
    xor ebx,ebx             ; ebx = 0
    inc ebx                 ; stdout fd = 1
    xor edx,edx             ; edx = 0
    mov dl,19               ; longitud del mensaje (18 + 1)
    int 0x80                ; write(1, string, 19)
    mov al,1                ; syscall exit: #1
    dec ebx                 ; ebx = 0
    int 0x80                ; exit(0)
dummy:
    call imprimir_str
    db 'ganaste guillermo!', 0x0b
