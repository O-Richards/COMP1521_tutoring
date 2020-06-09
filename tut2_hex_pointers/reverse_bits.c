#include <assert.h>
#include <stdio.h>

typedef unsigned int Word;

#define NUM_BITS(type) (sizeof(type) * 8)

Word reverseBits(Word w) {
    Word ret = 0; // Always initialise

    Word mask = 1u;
    for (int i = 0; i < NUM_BITS(Word); i++) {
        // Grab the bits value
        Word bit_value = (w & mask) != 0;
        mask <<= 1;

        // Add the value into ret
        ret <<= 1;
        ret |= bit_value;
    }
    return ret;
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E
    printf("%0x\n", reverseBits(w1));
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}

