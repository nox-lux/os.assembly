BITS 16
ORG 0X7C00

START:
    MOV BX, 1       ; BX = 1
    CMP BX, 4       ; if BX <= 4,
    JLE STATEMENT_1 ; then STATEMENT_1

    CMP BX, 40      ; elif BX < 40,
    JL STATEMENT_2  ; then STATEMENT_2

    JMP STATEMENT_3 ; else STATEMENT_3

; jumping to THE_END at the end of each statement is a must,
; to avoid going to the next statement below it
; without it: STATEMENT_1 -> STATEMENT_2 -> STATEMENT_3
; with it: STATEMENT_1 -> THE_END

STATEMENT_1:
    MOV AL, 'A'
    JMP THE_END
STATEMENT_2:
    MOV AL, 'B'
    JMP THE_END
STATEMENT_3:
    MOV AL, 'C'
    JMP THE_END

THE_END:
    MOV AH, 0X0E
    INT 0X10

    JMP $

    TIMES 510 - ($ - $$) DB 0
    DW 0XAA55
