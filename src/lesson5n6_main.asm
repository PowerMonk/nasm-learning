; Hello world program including external files

%include	"./lesson5_functions.asm"

SECTION .data
msg1    db    "Hello, I'm importing another file!", 0Ah, 0h ; null terminating byte so that the strings do not get continuous memory 
msg2    db    "This is how we recycle in NASM", 0Ah, 0h

SECTION .text
global _start

_start:
    mov eax, msg1 ; first message into eax
    call sprint ; print the first message

    mov eax, msg2 ; move the second message into eax
    call sprint ; print the second message
    
    call quit 
