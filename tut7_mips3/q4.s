.data

flag: .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
N_COLS = 12
N_ROWS = 6
NEW_LINE = 10

.text
# Register Defs:
# row = $t0
# col = $t1
# cur_letter = $t2
main:
    la $t2, flag
    li $t0, 0
for_begin_0:
    bge $t0, N_ROWS, for_end_0

    li $t1, 0
for_begin_1:
    bge $t1, N_COLS, for_end_1
    lb $a0, ($t2)
    li   $v0, 11
    syscall

    addi $t2, $t2, 1

    
for_continue_1:
    addi $t1, $t1, 1
    j for_begin_1

for_end_1:
    li $a0, NEW_LINE
    li $v0, 11
    syscall

for_continue_0:
    addi $t0, $t0, 1
    j for_begin_0

for_end_0:
    jr $ra
