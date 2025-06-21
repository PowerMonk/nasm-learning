SECTION .data
    msg db "Hola mundo! (Seg fault intended!)" , 0Ah ; db es define byte, 0Ah salto de linea 

SECTION .text
    global _start

_start:
    mov eax, 4      ; syscall write llamada a una función
    mov ebx, 1      ; fd stdout
    mov ecx, msg    ; dirección del mensaje
    mov edx, 33     ; longitud
    int 80h         ; llamada al SO

; No exit for this program since it is intended to obatin a Segmentation Fault
