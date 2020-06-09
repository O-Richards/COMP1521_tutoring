# Tutorial 1

# Introductions

* For most questions, ask on Discourse (You'll get a faster response!)
* I can answer some more personal questions if you email me: o.richards@unsw.edu.au
* Each week we have a one hour tutorial followed by a 2 hour lab
    * The lab is the best time for you to ask assignment questions!!!!
* Labs are automarked and must be submitted by Sunday
* If you have a camera and/or mic leave them on! (unless it is noisy)

## Number Representation

* What is the difference between a int8_t and int16_t? What numbers can these represent
* What base do computers represent numbers as?
* Why do software engineers often talk about octal and hex?
* Be able to convert numbers binary <-> octal <-> hex <-> decimal

### Question 2
 Show what the following decimal values look like in 8-bit binary, 3-digit octal, and 2-digit hexadecimal:

    a. 1
    b. 8
    c. 10
    d. 15
    e. 16
    f. 100
    g. 127
    h. 200 

How could I write a C program to answer this question? 

## Bitwise Operators

* What do each of the following operators do: 
    * &
    * |
    * <<
    * \>\>
* What is the difference between & and &&?
    * Calculate 5 && 6 and 5 & 6

### Question 3
Assume that we have the following 16-bit variables defined and initialised:

`uint16_t a = 0x5555, b = 0xAAAA, c = 0x0001;`

What are the values of the following expressions:

    a | b (bitwise OR)
    a & b (bitwise AND)
    a ^ b (bitwise XOR)
    a & ~b (bitwise AND)
    c << 6 (left shift)
    a >> 4 (right shift)
    a & (b << 1)
    b | c
    a & ~c 

Give your answer in hexadecimal, but you might find it easier to convert to binary to work out the solution.

### Question 6
Given the following type definition
`typedef unsigned int Word;`

Write a function

`Word reverseBits(Word w);`

... which reverses the order of the bits in the variable w.

For example: If w == 0x01234567, the underlying bit string looks like:

`0000 0001 0010 0011 0100 0101 0110 0111`

which, when reversed, looks like:

`1110 0110 1010 0010 1100 0100 1000 0000`

which is 0xE6A2C480 in hexadecimal.

## Pointers
