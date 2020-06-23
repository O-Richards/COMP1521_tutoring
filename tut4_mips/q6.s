.data


.text

#################
# Register defs #
#################
#   i = $t0
#   j = $t1

main:
#    int i = 1;
        li      $t0, 1
main_for_i_begin:
#    if (i > 10) {
#        goto main_for_i_end;
#    }
        bgt     $t0, 10, main_for_i_end
main_for_i_body:
#    int j = 0;
        li      $t1, 0
main_for_j_begin:
#    if (j >= i) goto main_for_j_end;
        bge     $t1, $t0, main_for_j_end

main_for_j_body:
#    printf("*");
        li      $a0, '*'
        li      $v0, 11
        syscall

main_for_j_continue:
#    j++;
        addi    $t1, $t1, 1
#    goto main_for_j_begin;
        j       main_for_j_begin

main_for_j_end:
#    printf("\n");
        li      $a0, '\n'
        li      $v0, 11
        syscall
main_for_i_continue:
#    i++;
        addi    $t0, $t0, 1
#    goto main_for_i_begin;
        j main_for_i_begin

main_for_i_end:
#    return 0;
#}
        li      $v0, 0
        jr      $ra

