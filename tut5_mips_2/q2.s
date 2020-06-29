    .data
aa:  .word 42
bb:  .word 666
cc:  .word 1
     .word 3
     .word 5
     .word 7

    .text
main:
    la   $t0, aa

    lw   $t0, bb

    lb   $t0, bb

    lw   $t0, aa+4

    la   $t1, cc
    lw   $t0, ($t1)

    la   $t1, cc
    lw   $t0, 8($t1)

    li   $t1, 8
    lw   $t0, cc($t1)

    la   $t1, cc
    lw   $t0, 2($t1)

    jr $ra


