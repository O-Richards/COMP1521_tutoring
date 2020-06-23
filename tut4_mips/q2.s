# print the squre of a number
# #include <stdio.h>

# int main(void) {
#  int x, y;
#  printf("Enter a number: ");
#  scanf("%d", &x);
#  y = x * x;
#  printf("%d\n", y);
#  return 0;// 
# }

.data
enter_a_number:
    .asciiz "Enter a number: "

.text
############################
# Register Definitions     #
############################
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

#  y = x * x;
        mul     $t1, $t0, $t0

#  printf("%d\n", y);
        move    $a0, $t1
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

#  return 0;
        li      $v0, 0
        jr      $ra
