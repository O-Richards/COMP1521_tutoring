// Simple factorial calculator  - without error checking

#include <stdio.h>

/*
int main (void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);

    int fac = 1;
    for (int i = 1; i <= n; i++) {
        fac *= i;
    }

    printf ("n! = %d\n", fac);
    return 0;
}
*/

int main (void) {
    int n;
    printf("n  = ");
    scanf("%d", &n);
    int fac = 1;

    int i = 1;
main_for_i_begin:
    if (i > n) {
        goto main_for_i_end;
main_for_i_body:
        fac *= i;

main_for_i_continue:
        i++;
        goto main_for_i_begin;

main_for_i_end:
    printf ("n! = %d\n", fac);
    return 0;
}
