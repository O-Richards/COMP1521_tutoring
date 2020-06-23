.data

n_equals_msg:
    .asciiz "n = "

n_fac_equals_msg:
    .asciiz "n! = "

.text

##################
# Register Defs  #
##################
# n = $t0
# fac = $t1
# i = $t2

main:
#    int n;
#    printf("n  = ");
        la      $a0, n_equals_msg
        li      $v0, 4
        syscall

#    scanf("%d", &n);
        li      $v0, 5
        syscall
        move    $t0, $v0
#    int fac = 1;
        li      $t1, 1

#    int i = 1;
        li      $t2, 1
main_for_i_begin:
#    if (i > n) {
#        goto main_for_i_end;
        bgt     $t2, $t0, main_for_i_end
main_for_i_body:
#        fac *= i;
        mul     $t1, $t1, $t2

main_for_i_continue:
#        i++;
        addi    $t2, $t2, 1
#        goto main_for_i_begin;
        j       main_for_i_begin

main_for_i_end:
#    printf ("n! = %d\n", fac);
        #printf("n! = ");
        la      $a0, n_fac_equals_msg
        li      $v0, 4
        syscall

        move    $a0, $t1
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

#    return 0;
        li      $v0, 0
        jr      $ra
