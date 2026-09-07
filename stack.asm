; if a function changes registers that the caller
; expects to remain unchanged, save them before changing them
; and restore them before returning.
DEMONSTRATE:
    PUSHA         ; Push all register values to the stack
    MOV BX , 10
    ADD BX , 20
    MOV AH , 0X0E ; int =10/ ah =0 x0e -> BIOS tele - type output
    INT 0X10      ; print the character in al
    POPA          ; Restore original register values
    RET
