# int increment(int a) {
#    return a + 1;
# }

#int main(void) {
#    int a;
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
    sw $fp, -4($sp)
    la $fp, -4($sp)
    sw $ra, -4($fp)
    sw $s0, -8($fp)
    la $sp, -8($fp)

    addi $v0, $a0, 1

    lw $s0, -8($fp)
    lw $ra, -4($fp)
    la $sp, 4($fp)
    lw $fp, ($fp)

    jr $ra

main:
    # there is a nasty bug here what is it!
    li $a0, 0
    jal increment
    move $a0, $v0
    li $v0, 1
    syscall
    jr $ra
