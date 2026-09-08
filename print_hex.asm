BITS 16
ORG 0X7C00

SECTION .text
MAIN:
    MOV DX, 0x1A2F  ; the 16-bit hex value to print
    CALL print_hex

    JMP $
print_hex:
    PUSHA           ; save all registers to the stack

    MOV CX, 4       ; loop counter: 4 nibbles in a 16-bit word
.loop:
    ; isolate the highest nibble (4 bits) of DX
    MOV AX, DX
    SHR AX, 12      ; shift right by 12 to bring the top 4 bits to the bottom of AL

    ; convert the nibble to its ASCII character representation
    CMP AL, 10
    JL .is_digit
    ADD AL, 7       ; if A-F, add adjustment gap between '9' (0x39) and 'A' (0x41)
.is_digit:
    ADD AL, 0X30    ; add ASCII offset for '0'

    MOV AH, 0X0E
    INT 0X10

    ; rotate DX left by 4 bits to prepare the next nibble for the next loop iteration
    SHL DX, 4

    LOOP .loop      ; decrement CX, loop if CX != 0

    POPA            ; restore all registers from the stack
    RET             ; return to caller

TIMES 510 - ($ - $$) DB 0
DW 0XAA55
