SECTION .data
msg	db "Hola mundo! con strings de valores variables", 0Ah ; Ahora podemos usar el string con longitud variable

SECTION .text
global _start

_start:
    mov ebx, msg ; mover la dirección de message en EBX
    mov eax, ebx ; mover la dirección de EBX en EAX (para que ambos apunten a la misma dirección de memoria)

nextchar:
    cmp byte [eax], 0 ; comparar el byte al que apunta EAX con 0 (cero indica el final de los strings)
    jz finished ; revisa si el zero flag se activó en la última comparación
    inc eax ; incrementar la direccion en EAX por un byte (si aún no se tiene el flag de zero)
    jmp nextchar

finished:
    sub eax, ebx ; restar la direccion de EBX a EAX recordando que ambos registros apuntaban originalmente a la misma linea
                 ; EAX fue incrementando de un byte en un byte en las direcciones de memoria
		 ; cuando restar una dirección de memoria de otra del mismo tipo, el resultado es el número de segmentos entre ellas
		 ; en este caso, el número de bytes


    mov edx, eax ; EAX ahora es igual al número de bytes en el string
    mov ecx, msg ; dirección del mensaje
    mov ebx, 1  ; stdout
    mov eax, 4   ; syscall write
    int 80h

    xor ebx, ebx ; mayor velocidad
    mov eax, 1   ; syscall exit
    int 80h
