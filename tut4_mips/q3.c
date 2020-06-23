#include <stdio.h>
#include <stdio.h>

int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 46340) {
        goto if_x_else;
    }

if_x_gt_46340:
        printf("square too big for 32 bits\n");
        goto if_x_end;
if_x_else:
        y = x * x;
        printf("%d\n", y);
if_x_end:

    return 0;
}
