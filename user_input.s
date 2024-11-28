section .data
    usrMsg  db  "Please enter a number: "
    lenUsrMsg   equ $-usrMsg
    dispMsg db  "You have entered: "
    lenDispMsg  equ $-dispMsg

section .bss
    num resb    10 ; if 5 used, a smaller number has to be inserted

section .text
    global  _start

_start:
    ; Display message to prompt input
    mov eax,4
    mov ebx,1
    mov ecx,usrMsg
    mov edx,lenUsrMsg
    int 80h

    ; Read and store the user input
    mov eax,3
    mov ebx,2
    mov ecx,num
    mov edx,10 ; if 5 used, a smaller number has to be inserted
    int 80h

    ; Display info message
    mov eax,4
    mov ebx,1
    mov ecx,dispMsg
    mov edx,lenDispMsg
    int 80h

    ; Display the entered number
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,10 ; if 5 used, a smaller number has to be inserted
    int 80h

    ; Exit code
    mov eax,1
    mov ebx,0
    int 80h