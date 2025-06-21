; Hello world with no segmentation fault due to proper exit with a syscall

SECTION .data
    msg db "Hola mundo! (sin seg fault!)" , 0Ah ; db es define byte

SECTION .text
    global _start

_start:
    mov eax, 4      ; syscall write llamada a una función
    mov ebx, 1      ; fd stdout
    mov ecx, msg    ; dirección del mensaje
    mov edx, 29     ; longitud (29 porque contamos el salto de linea)
    int 80h         ; llamada al SO

    mov eax, 1      ; syscall exit
    xor ebx, ebx    ; código de salida 0
    int 80h

