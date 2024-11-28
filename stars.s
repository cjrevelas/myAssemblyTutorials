section .text
    global _start   ; must be declared for linker (gcc)

_start:         ; tell linker entry point
    mov edx,len ; message length
    mov ecx,msg ; message to write
    mov ebx,1   ; file descriptor corresponding to stdout
    mov eax,4   ; system call number corresponding to sys_write
    int 0x80    ; use an interrupt to call the kernel

    mov edx,9   ; message length
    mov ecx,s2  ; message to write
    mov ebx,1   ; file descriptor corresponding to stdout
    mov eax,4   ; system call number corresponding to sys_write
    int 0x80    ; use an interrupt to call the kernel

    mov edx,len2    ; message length
    mov ecx,line    ; message to write
    mov ebx,1       ; file descriptor corresponding to stdout
    mov eax,4       ; system call number corresponding to sys_write
    int 0x80        ; use an interrupt to call the kernel

    mov eax,1   ; system call number corresponding to sys_exit
    int 0x80    ; use an interrupt to call the kernel

section .data
msg db  "Displaying 9 stars" ; message
line db 0xa ; print a new line in the console
len equ $ - msg ; message length
len2 equ $ - line
s2  times 9 db "*"