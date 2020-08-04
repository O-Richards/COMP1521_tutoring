#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Args!!");
        return -1;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("opening file");
        return -1;
    }

    char buf[100];
    while (fgets(buf, 100, file) != NULL) {
        long num = strtol(buf, NULL, 16);
        
        unsigned long mask = 0xFF;
        //int bottom_val = num & mask;
        // Masking no good - we need to sign extend.
        // Easy way to do this is bit shifting
        //
        int bottom_val = num;
        bottom_val <<= (32-8);
        bottom_val >>= (32-8);
        printf("%d\n", bottom_val);
    }
}
