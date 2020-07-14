#int cube[4][4][4];

#int nzeroes = 0;
#for (int i = 0; i < 4; i++)
#	for (int j = 0; j < 4; j++)
#		for (int k = 0; k < 4; k++)
#           nzeroes += (cube[i][j][k] == 0)

.data
cube: .space 4*4*4*4

.text

# Register Definitons
# nzeros = $t0
# i      = $t1
# j      = $t2
# k      = $t3
main:

    li $t0, 0 #nzeros = 0

    li $t1, 0 # i = 0
for_begin_0:
    bge $t1, 4, for_end_0

    li $t2, 0
for_begin_1:
    bge $t2, 4, for_end_1

    li $t3, 0
for_begin_2:
    bge $t3, 4, for_end_2

    # calculate offset
    # offset $t9
    mul $t9, $t1, 16
    mul $t8, $t2, 4
    add $t9, $t8, $t9
    add $t9, $t9, $t3
    mul $t9, $t9, 4

    lw $t8, cube($t9) # cube + ($t9)
    bnez $t8, if_end
if_begin:
    addi $t0, $t0, 1

if_end:

for_continue_2:
    add $t3, $t3, 1
    j for_begin_2
for_end_2:

for_continue_1:
    addi $t2, $t2, 1
    j for_begin_1

for_end_1:


for_continue_0:
    addi $t1, $t1, 1
    j for_begin_0
for_end_0:
    
    jr $ra
