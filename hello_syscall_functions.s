%include "macros.s"

%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

section .data                  ; data segment
    msg db "Hello world!", 0xa ; the string to be printed
    len equ $ -msg             ; length of the string

section .text                  ; code segment
    global main                ; declare "main" entry point for the linker


;
; Function that prints a message to the console
;
print:
    prologue

    mov  rax, SYSCALL_WRITE     ; WRITE system call will be performed
    mov  rdi, STD_OUT           ; file descriptor corresponding to stdout
    lea  rsi, [msg]             ; message to write to stdout
    mov  rdx, len               ; length of the message
    syscall                     ; perform the system call

    epilogue

;
; Function that invokes the EXIT system call
; to terminate the program's execution.
;
exit:
    prologue

    mov  rax, SYSCALL_EXIT     ; EXIT system call will be performed
    mov  rdi, 0                ; error code
    syscall                    ; perform the system call

    epilogue

;
; The main function of the program
;
main:                          ; entry point
    call print                 ; print message to the console
    call exit                  ; terminate program execution

