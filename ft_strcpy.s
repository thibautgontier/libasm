segment .text
    global _ft_strcpy

; here the args are in rdi, rsi
_ft_strcpy:
    push    rdx         ; push rdx on top of stack, will be copied char
    push    rcx         ; push rcx on top of stack, will be counter
    mov     rdx, 0      ; init to 0
    mov     rcx, 0      ; init to 0
    cmp     rsi, 0      ; check if rsi (arg) is empty
    jz      null_error  ; jump to null_error
    _copy_loop:
        mov dl, byte [rsi + rcx]    ; moves the next byte of rsi to temp holder
        mov byte [rdi + rcx], dl    ; move the temp holder byte to rdi's corresponding byte
        cmp [rsi + rcx], byte 0     ; check if we have reached the end of the str
        jz  _exit                    ; jump to exit
        inc rcx                     ; increment counter
        jmp _copy_loop              ; go back through loop
    _exit:
        mov rax, rdi                ; mov copied string to return value
        pop rcx                     ; pop rcx from top of stack
        pop rdx                     ; pop rdx from top of stack
        ret                         ; returns rax

null_error:
    mov rax, rsi                    ; move rsi to rax (return)
    pop rcx                     ; pop rcx from top of stack
    pop rdx                     ; pop rdx from top of stack
    ret