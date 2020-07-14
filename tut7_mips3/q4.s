.data

flag: .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
N_COLS = 12
N_ROWS = 6
NEW_LINE = 10

.text
# Register Defs:
# row = $t0
# col = $t1
# offset = $t2
main:
    li $t0, 0
for_begin_0:
    bge $t0, N_ROWS, for_end_0

    li $t1, 0
for_begin_1:
    bge $t1, N_COLS, for_end_1

    # printf ("%c", flag[row][col]);
    # offset = element size * (row * N_COLS + col)
    mul $t2, $t0, N_COLS
    add $t2, $t2, $t1

    # Address = base_addr + offset
    # do the printf
    lb $a0, flag($t2) # flag + ($t2)
    li $v0, 11
    syscall

for_continue_1:
    addi $t1, $t1, 1
    j for_begin_1
for_end_1:

# printf ("\n");
    li $a0, NEW_LINE
    li $v0, 11
    syscall


for_continue_0:
    addi $t0, $t0, 1
    j for_begin_0
for_end_0:

    jr $ra
