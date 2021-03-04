segment .text
    global _ft_strcmp

; here the args are in rdi, rsi
_ft_strcmp:
    cmp rsi, 0
    jz  rsi_null
    cmp rdi, 0
    jz  rdi_null
    mov rax, 0
    jmp compare

compare:
    mov al, BYTE [rdi]  ; get least sign. digit from rdi
    mov bl, BYTE [rsi]  ; get least sign. digit from rsi
    cmp al, 0           ; make sure we are at the end of al (rdi)
    je  exit            ; if not, jump to exit
    cmp bl, 0           ; make sure we are at the end of bl (rsi)
    je  exit            ; if not, jump to exit
    cmp al, bl          ; comparison of the two
    jne exit            ; if the result of cmp is != 0 (different), jump to exit
    inc rdi             ; increment rdi
    inc rsi             ; increment rsi
    jmp compare         ; goes back up to loop again

rsi_null:
    mov rax, rdi
    ret

rdi_null:
    mov rax, rsi
    ret

exit:
    movzx   rax, al     ; copy al to rax and fill rest with 0
    movzx   rbx, bl     ; copy bl to rbx and fill rest with 0
    sub rax, rbx        ; the difference between the two is stored in rax
    ret                 ; returns rax (difference)