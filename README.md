
## assembly

a basic .asm self-learning
all of this contribute to OS and bootloader, which is why all files end with the **Magic Number**.

---

assembler: NASM  
architecture: x86

---

use the `./run.sh` script and select the file you want to run. **requires QEmu and NASM**.

contents:
1. [`comparison.asm`](#comparisonasm)
2. [`print.asm`](#printasm)
3. [`stack.asm`](#stackasm)

---

## `comparison.asm`
```asm
je target ; jump if equal ( i.e. x == y )
jne target ; jump if not equal ( i.e. x != y )
jl target ; jump if less than ( i.e. x < y )
jle target ; jump if less than or equal ( i.e. x <= y )
jg target ; jump if greater than ( i.e. x > y )
jge target ; jump if greater than or equal ( i.e. x >= y )
```

---

## `print.asm`
register AX is of 16 bits.
```text
AX:
┌────────────┬────────────┐  
│     AH     │     AL     │  
│   8 bits   │   8 bits   │  
└────────────┴────────────┘  
AH: BIOS operation
AL: which character
```
`AH = 0X0E`: BIOS TTY output, falls under `INT 10h`.

---

## `stack.asm` (WIP)

---

references: Writing a Simple Operating System — from Scratch (Nick Blundell)
