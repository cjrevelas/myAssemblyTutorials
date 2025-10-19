%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

section .data                  ; data segment
    msg db "Hello world!", 0xa ; the string to be printed
    len equ $ -msg             ; length of the string

section .text                  ; code segment
    global main                ; declare "main" entry point for the linker

;
; The following macro sets up the the stack frame of a function.
;
%macro prologue 0
    push rbp                   ; save rbp on the stack to restore it at the end of the function
    mov rbp, rsp               ; set rbp to rsp
%endmacro

;
; THe following macro restores rbp from the stack and returns to the caller.
;
%macro epilogue 0
    mov rsp, rbp               ; discard local variables and restore stack pointer
    pop rbp                    ; restore the old frame pointer
    ret
%endmacro

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
