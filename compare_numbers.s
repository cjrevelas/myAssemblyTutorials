%include "macros.s"

section .data
        fmt db "max(%ld,%ld) = %ld",0xa,0

section .text
        global main
        extern printf

; print_larger will receive two parameters: a, b and store the larger in max
a       equ 0               ; local variable 1 (first parameter)
b       equ 8               ; local variable 2 (second parameter)
max     equ 16

print_larger:
        prologue
    
        sub rsp, 32         ; leave space for a, b, max (multiple of 16 bytes to ensure stack alignment)
    
        mov [rsp+a], rdi    ; save a
        mov [rsp+b], rsi    ; save b
        mov [rsp+max], rdi  ; save a as larger temporarily
        
        cmp rsi, rdi        ; check if (b - a) > 0
        jng skip            ; if rsi<rdi (b < a) -> go to skip label
        mov [rsp+max], rsi  ; if rsi>rdi (b > a)
skip:
        mov rdi, fmt        ; = lea rdi, [fmt]
        mov rsi, [rsp+a]
        mov rdx, [rsp+b]
        mov rcx, [rsp+max]
        
        xor eax, eax
        call printf
    
        epilogue

exit:
        prologue
        mov eax, 1
        mov ebx, 0
        int 0x80
        epilogue

main:
        prologue
        mov rdi, 50         ; a = 50, i.e., first argument of print_larger
        mov rsi, 70         ; b = 70, i.e., second argument of print_larger
        call print_larger
        call exit
        epilogue
    
    
