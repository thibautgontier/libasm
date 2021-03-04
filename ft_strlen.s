segment .text
    global _ft_strlen

; here the char *s argument is stored in rdi
_ft_strlen:
    mov     rax, 0  ; rax is return value, start at 0
    jmp    count    ; jumps to count loop

count:
    cmp byte [rdi + rax], 0 ; if rdi + rax = 0 (reached end of str)
    jz  exit                ; jumps to exit
    inc rax                 ; counter += 1
    jmp count               ; goes back to the loop

exit:
    ret                    ; returns rax (count)


