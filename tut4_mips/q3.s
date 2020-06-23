# #include <stdio.h>

# int main(void) {
#   int x, y;
#   printf("Enter a number: ");
#   scanf("%d", &x);

#   if (x > 46340) {
#      printf("square too big for 32 bits\n");
#    } else {
#        y = x * x;
#        printf("%d\n", y);
#    }
#    
#    return 0;
#}

.data
enter_a_number:
    .asciiz "Enter a number: "
square_too_big:
    .asciiz "square too big for 32 bits\n"

.text

#######################
# Register Defintions #
#######################
#   x = $t0
#   y = $t1
main:
#  printf("Enter a number: ");
        la      $a0, enter_a_number
        li      $v0, 4
        syscall

#  scanf("%d", &x);
        li      $v0, 5
        syscall
        move    $t0, $v0


#if (x <= 46340) {
#   goto if_x_else;
#}

# Test
        li      $t2, 46340
        bge     $t2, $t0, if_x_else
if_x_gt_46340:
        la      $a0, square_too_big
        li      $v0, 4
        syscall
        j       if_x_end
if_x_else:
#  y = x * x;
        mul     $t1, $t0, $t0
#  printf("%d\n", y);
        move    $a0, $t1
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

if_x_end:

#  return 0;
        li      $v0, 0
        jr      $ra
