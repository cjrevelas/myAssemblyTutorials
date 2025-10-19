%define SYSCALL_EXIT 60

section .data 
    a dq 3
    b dq 4
    arg1 equ 0
    arg2 equ 8

section .text
    global main

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

pyth_triangle:
    prologue

    sub rsp, 16

    mov [rsp+arg1], rdi
    mov [rsp+arg2], rsi

    xor  rax, rax
    xor  rbx, rbx
    xor  rcx, rcx

    mov rbx, [rsp+arg1]
    imul rbx, [rsp+arg1]
    mov rcx, [rsp+arg2]
    imul rcx, [rsp+arg2]

    add rax, rbx
    add rax, rcx

    epilogue

exit:
    prologue
    mov rax, SYSCALL_EXIT  ; system-call number corresponding to sys_exit
    mov rdi, 0             ; error code
    syscall                ; perform the system call
    epilogue

main:
    mov rdi, [a]
    mov rsi, [b]
    call pyth_triangle
    call exit
