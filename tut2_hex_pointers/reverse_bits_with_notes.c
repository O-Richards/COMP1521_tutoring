
#include <assert.h>
#include <stdio.h>
typedef unsigned int Word;

/*
 * Reverses the bits in a Word
 * For example if a Word were 4 bits (for simplicty)
 * 4 == 0100 -> 2 == 0010
 * 5 == 0101 -> 10 == 1010
 */
Word reverseBits(Word w) {
    Word reversed = 0; // *always* initialise your variables when declared

    // sizeof() returns the # bytes in a type. There are 8 bits per byte
    int num_bits = sizeof(Word) * 8; 

    // for each bit...
    for (int bit_num = 0; bit_num < num_bits; bit_num++) {
        Word mask = 1u << bit_num;
        // Say bit_num == 1 mask will be:
        // 00...0010

        // Extract the value of the bit at bit_num
        Word masked_w = w & mask;
        // Say bit_num == 1, masked_w will be:
        // 00...00X0
        // Where X is 1 if the bit in w is 1 and 0 else
        // I.e. masked_w == 0 if the bit is 0 or some power of 2 if the bit is a 1
        Word bit_value = (masked_w != 0);

        if (bit_value == 1) {
            // We need to insert a 1 into ret!
            // The funky maths is to reverse the index
            // I.e. if bit_num is 1, we want a mask with a 1 in the 30th bit
            // For the lab, think about how array indexing works versus this bit masking
            // If I go array[0] does this reference the left or rightmost element?
            // How about if I do (w & (1u << 0)) - Which bit is this inspecting
            Word insert_mask = 
                (1u << (num_bits - bit_num - 1));
            // We now have (for bit_num == 1) insert_mask of:
            // 0100...000
            // We can set the bit with a 1 in the mask in reversed by using an or operation
            reversed |= insert_mask;
        }
    }
    return reversed;
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

