#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint32_t six_middle_bits(uint32_t num) {
}

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("usage: %s number\n", argv[0]);
        return 0;
    }

    uint32_t num = atoi(argv[1]);

    printf("0x%0x\n", six_middle_bits(num));

}
