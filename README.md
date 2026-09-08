
## os.assembly

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
3. [`print_hex.asm`](#print_hexasm)
4. [`stack.asm`](#stackasm)

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

## `print_hex.asm`
(not so) simple hex to hex-string converter. assembly lacks a way to type-cast.  
so content is extracted bit-wise. kind of mind-blowing.

---

## `stack.asm`
skipping out on fluff: use these as a way to create "restore points".  
if a register expects values to stay same, but you decide to change it,  
push it into a stack, push the changes on top, and pop the changes when done.  

---

references: Writing a Simple Operating System — from Scratch (Nick Blundell)
