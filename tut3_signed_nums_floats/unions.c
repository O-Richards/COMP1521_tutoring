#include <stdio.h>

typedef struct x1_ {
    int a;
    float b;
} x1;

typedef union x2_ {
    int a;
    float b;
} x2;

int main(void) {
    printf("struct x1 is %lu bytes\n", sizeof(x1));
    printf("union x2 is %lu bytes\n", sizeof(x2));

    x1 structInst;
    x2 unionInst;

    //What is the difference between these operations
    
    structInst.a = 5;
    structInst.b = 10;
    //printf("a = %d, b = %f\n", structInst.a, structInst.b);

    unionInst.b = 10;
    unionInst.a = 5;
    //printf("a = %d, b = %f\n", unionInst.a, unionInst.b);

    unionInst.a = 5;
    unionInst.b = 10;
    //printf("a = %d, b = %f\n", unionInst.a, unionInst.b);
}
