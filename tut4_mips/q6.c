// print a triangle
/*
#include <stdio.h>

int main (void) {
    for (int i = 1; i <= 10; i++) {
        for (int j = 0; j < i; j++) {
            printf("*");
        }
        printf("\n");
    };
    return 0;
}
*/
#include <stdio.h>
int main (void) {
    int i = 1;
main_for_i_begin:
    // test i
    if (i > 10) {
        goto main_for_i_end;
    }

//main_for_i_body:
    int j = 0;
main_for_j_begin:
    if (j >= i) goto main_for_j_end;

main_for_j_body:
    printf("*");

main_for_j_continue:
    j++;
    goto main_for_j_begin;

main_for_j_end:

    printf("\n");
main_for_i_continue:
    i++;
    goto main_for_i_begin;

main_for_i_end:
    return 0;
}
