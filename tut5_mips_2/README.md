# Week 5 Tutorial - Mips 2

## Memory Tips:
* Always think carefully should I be using lb/sb or lw/sw
    * What is the difference?
* Check your array bounds!
* Take a look at the addressing modes in the docs https://cgi.cse.unsw.edu.au/~cs1521/20T2/resources/spim.html
* When you see ($t0) think of it as saying explicitly "Register $t0 contains a pointer to the data I want"

## The Data Segment

The data segment is where we store global variables
We can use assembler directives to store different types of values or allocate space

e.g.

```
    .data # Place the following in the data segment
# Variables in the data segment have the form:
#label:     .type   value
a:  .word   42
b:  .space  4
c:  .asciiz "abcde"
    .align  2           # When is the .align directive needed?
d:  .byte   1, 2, 3, 4
e:  .word   1, 2, 3, 4
f:  .space  1
```

If the data segment of a particular MIPS program starts at the address 0x10000020, 
then what addresses are the following labels associated with, 
and what value is stored in each 4-byte memory cell? 

### Align Directive

```
    .data
str: .asciiz "h"
     .align   4 # Align to the next address divisible by 4
int: .word    1
    .text

main:
    lw $t0, (int) # lw can only access words alligned on 4 byte boundries
                  # Without the .align directive, int will not be 4 byte alligned
                  # And your program will crash!

    jr $ra
```

## Question 3

Remember, by default SPIM used little-endian byte ordering!
I.e. the least significant byte is at the base address

When we use lb, the other 3 bytes are sign extended!
