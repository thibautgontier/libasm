segment .text
    global  _ft_strdup
    extern  _malloc
    extern  _ft_strcpy
    extern  _ft_strlen

; here the args are in rdi
_ft_strdup:
    cmp     rdi, 0      ; check that the arg isn't empty
    jz      _error      ; if empty, send to error
    call    _ft_strlen  ; get the size for allocation
    add     rax, 1      ; add 1 to the str to account for \0
    push    rdi         ; push rdi to top of stack (save value)
    mov     rdi, rax    ; save the length for malloc in rdi
    call    _malloc     ; allocate to rax using rdi as length
    cmp     rax, 0      ; check for error in the malloc
    jz      _error       ; if rax is null, send to error
    pop     rdi         ; get rdi data back from stack
    mov     rsi, rdi    ; get the data in rsi
    mov     rdi, rax    ; put the string in rdi
    call    _ft_strcpy  ; strcpy the string in rdi
    ret                 ; return data in rax

_error:
    mov     rax, 0      ; set rax to 0
    ret