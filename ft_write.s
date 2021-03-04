extern  ___error

segment .text
        global _ft_write

; here the args are in rdi, rsi, rdx
_ft_write:
    mov r8, rdx     ; move rdx (len arg) to r8
    mov rax, 0x2000004  ; sys call for write
    syscall             ; call it
    jc  error           ; if carry flag is set, send to error
    mov rax, r8         ; mov value into rax to return
    ret                 ; return rax
    
error:
            mov         r15, rax            ; sav errno
            call        ___error            ; retrieve address to errno
            mov         rax, -1             ; move the error code in rax to return
            ret                             ; return rax
