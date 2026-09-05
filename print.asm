BITS 16
ORG 0X7C00

START:
    MOV BX, HELLO
    CALL PRINT_STRING

    MOV BX, BYE
    CALL PRINT_STRING

    JMP $

; iterate through the string
PRINT_STRING:
    MOV AL, [BX]
    MOV AH, 0X0E
    INT 0X10

    CMP AL, 0
    JE FINISH        ; if AL == 0, return to the caller
    INC BX           ; shift by one byte

    JMP PRINT_STRING ; back to loop beginning

FINISH:
    RET
HELLO:
    DB 'Hello, World!', 0
BYE:
    DB 'Goodbye!', 0

TIMES 510 - ($ - $$) DB 0
DW 0XAA55
