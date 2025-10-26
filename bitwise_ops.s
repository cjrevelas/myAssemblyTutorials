%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

section .data                  ; data segment

section .text                  ; code segment
    global main                ; declare entry point for the linker

main:                          ; entry point

    ; task 1: extract the digits 5, 6 in the following number
    mov rax, 0x12345678        ; the number from which we want to extract bits 8-15
    shr rax, 0x8               ; shift the number 8 bits to the right (8 bits = 2 hex digits)
    and rax, 0xff              ; "and" the number with the value 0xff to isolate the 8 right-most bits

    ; task2: replace the digits 5, 6 in the following number with a, a
    mov rax, 0x12345678        ; the number whose digits 8-15 we wish to replace
    mov rdx, 0xaa              ; rdx contains the new digits
    mov rbx, 0xff              ; rbx contains the 8-bit mask
    shl rbx, 8                 ; shift the mask left to align it with the digits that will be replaced
    not rbx                    ; invert the mask
    and rax, rbx               ; the bits 8-15 of the original number are equal to zero
    shl rdx, 8                 ; shift the new number left to align it with the digits that will be replaced
    or  rax, rdx               ; "or" the original value with the new value

    mov rax, SYSCALL_EXIT      ; system-call number corresponding to sys_exit
    mov rdi, 0                 ; error code
    syscall                    ; perform the system call
