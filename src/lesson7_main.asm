; Hello world program (print with line feed)

%include './lesson7_lf_functions.asm'

SECTION .data
msg1	db	"Hello, brave new world!", 0h ; note we removed the line feed character 0Ah
msg2	db	"This is how we recycle in NASM.", 0h

SECTION .text
global _start

_start:

    mov eax, msg1
    call sprintLF ;  NOTE we call our new print with linefeed lesson7_lf_functions

    mov eax, msg2
    call sprintLF

    call quit
