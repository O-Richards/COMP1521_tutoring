

.text
main:
    
    jr $ra

# void change(int nrows, int ncols, int M[][], int factor)
# Arguments
# nrows = $a0
# ncols = $a1
# M     = $a2
# factor = $a3
# Returns 
#   Nill

# Tempory Reg Definitions:
# row = $t0
# col = $t1

# Safe Reg Definitions
# nill

change:
# Setup stack frame
    sw $fp, -4($sp)
    la $fp, -4($sp)
    sw $ra, -4($fp)
    addi $sp, $fp, -4


    move $t2, $a2
    li $t0, 0
for_begin_0:
    bge $t0, $a0, for_end_0

    li $t1, 0
for_begin_1:
    bge $t1, $a1, for_end_1

    lw $t9, ($t2)
    mul $t9, $t9, $a3
    sw $t9, ($t2)

    addi $t2, $t2, 4

    
for_continue_1:
    addi $t1, $t1, 1
    j for_begin_1

for_end_1:

for_continue_0:
    addi $t0, $t0, 1
    j for_begin_0

# Epolioge - fix up stack
    lw $ra, -4($fp)
    la $sp, 4($fp)
    lw $fp, ($fp)

    jr $ra
    
