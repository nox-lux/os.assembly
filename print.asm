BITS 16
ORG 0X7C00

START:
    MOV AL, '!'
    MOV AH, 0X0E
    INT 0X10

; refer README > print.asm

TIMES 510 - ($ - $$) DB 0
DW 0XAA55
