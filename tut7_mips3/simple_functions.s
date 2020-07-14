# int increment(int a) {
#    return a + 1;
# }

#int main(void) {
#    int a = 0;
#    a = increment(a);
#    printf("%d\n", a);
#}

.text

# Arguments:
#   a = $a0
# Returns
#   a + 1 = $v0
# Temp Reg. Def's
#   Nill
# Safe Reg. Def's
#  $s0
increment:
# prologue
    sw  $fp, -4($sp)
    la  $fp, -4($sp)
    sw  $ra, -4($fp)
    sw  $s0, -8($fp)
    la  $sp, -8($fp)


# Function body
    addi $v0, $a0, 1

# Epilogue
    la $sp, 8($fp) 
    lw $s0, -8($fp) 
    lw $ra, -4($fp)
    lw $fp, ($fp)

    jr $ra

main:
    # there is a nasty bug here what is it!
    move $s0, $ra
    li $a0, 0
    jal increment # j -> doesnt change the $ra
                  # jal -> jumps & sets the $ra to be the next instruction
    move $a0, $v0
    li $v0, 1
    syscall
    jr $s0
