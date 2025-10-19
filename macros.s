;
; The following macro sets up the the stack frame of a function.
;
%macro prologue 0
    push rbp                   ; save rbp on the stack to restore it at the end of the function
    mov rbp, rsp               ; set rbp to rsp
%endmacro

;
; The following macro restores rbp from the stack and returns to the caller.
;
%macro epilogue 0
    mov rsp, rbp               ; discard local variables and restore stack pointer
    pop rbp                    ; restore the old frame pointer
    ret
%endmacro
