SECTION .data
msg	db	"Hola mundo con funciones!", 0Ah

SECTION .text
global _start

_start:

    mov eax, msg ; move the address of our message string into EAX
    call strlen ; call our function to calculate the length of the string

    mov edx, eax ; our function leaves the result in EAX
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    xor ebx, ebx
    mov eax, 1
    int 80h

strlen: ; this is our first function declaration
    push ebx ;  push the value EBX onto the stack to preserve it while we use EBX in this function
    mov ebx, eax ; move the address in EAX into EBX (both point to the same segment in memory)
 
 nextchar:
     cmp byte [eax] , 0
     jz finished
     inc eax
     jmp nextchar

 finished:
     sub eax, ebx
     pop ebx ; pop the value on the stack back into EBX
     ret ; return to the place where the function was called

