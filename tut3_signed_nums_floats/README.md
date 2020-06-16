# Tutorial 2 - More Number Representations

So far, we have worked out how to express numbers like 5, 10 etc. using the binary rep. of these numbers
e.g. 5 == 1001

But a computer would be pretty useless if you could only do calculations with positive integers!

So out tasks this week are to look at how to represent:
1. Signed numbers e.g. -5
2. Real numbers i.e. non-integers e.g. 2.5

## Question 1 

On a machine with 16-bit ints, the C expression `(30000 + 30000)` yields a negative result.
Why the negative result? How can you make it produce the correct result?

## Question 2 - Signed 2's Compliment

* One (of many possible) representations of signed numbers in binary
* Most Significant Bit (i.e. leftmost normally) is the sign bit
    * If 0 -> positive
    * If 1 -> negative
* When a number is negative, we must take the 2's compliment to find the actual value
    * Flip all the bits then add 1
    * i.e. 2's compliment(i) = ~i + 1
* Hint: printf("%x", i) will give you the 2's compliment rep

Assume that the following hexadecimal values are 16-bit twos-complement. Convert each to the corresponding decimal value. 

i. 0x0013
ii. 0x0444
iii. 0x1234
iv. 0xffff
v. 0x8000

## Question 3 - decimal -> signed 2's compliment

Give a representation for each of the following decimal values in 16-bit twos-complement bit-strings. Show the value in binary, octal and hexadecimal.

a. 1
b. 100
c. 1000
d. 10000
e. 100000
f. -5
h. -100 

## Question 4 - Float Representation

![alt text][float_comp]

* Exponent is *biased* exponent
* value = (-1)^sign * (1.mantisa) * 2 ^ (exponent - 127)

[float_comp]: resources/float_comp.jpg

What decimal numbers do the following single-precision IEEE 754-encoded bit-strings represent? 

a. 0 00000000 00000000000000000000000
b. 1 00000000 00000000000000000000000
c. 0 01111111 10000000000000000000000
d. 0 01111110 00000000000000000000000
e. 0 01111110 11111111111111111111111
f. 0 10000000 01100000000000000000000
h. 0 10010100 10000000000000000000000
i. 0 01101110 10100000101000001010000

## Question 5

Convert the following decimal numbers into IEEE 754-encoded bit-strings: 
a. 2.5
b. 0.375
c. 27.0
d. 100.0

## Question 6

Write a C function, six_middle_bits, which, given a uint32_t, extracts and returns the middle six bits.

## Unions

Remember that memory is just a gigantic collection of 0's and 1's
Now, as a programmer, we can choose to interpret those bits however we like e.g. as a float, int, string etc.
Sometimes, it may be useful to interpret the same set of bits in different ways
Unions allow us to do this
For example, if we would like to inspect the bit values of a float (like in the previous question) we could use a union

```C
typedef union {
    uint32_t bits;
    float f;
} float_t; 

float_t f;
f.bits = 0xFF001000;
printf("bits: 0x%x float val: %f\n", f.bits, f.f);
```

## Question 8



Consider the following C union

```C
union _all {
   int   ival;
   char cval;
   char  sval[4];
   float fval;
   unsigned int uval;
};
```

If we define a variable union _all var; and assign the following value var.uval = 0x00313233;, then what will each of the following printf(3)s produce:

```C
printf("%x\n", var.uval);
printf("%d\n", var.ival);
printf("%c\n", var.cval);
printf("%s\n", var.sval);
printf("%f\n", var.fval);
printf("%e\n", var.fval); 
```

You can assume that bytes are arranged from right-to-left in increasing address order. 

Little endian!

![alt text][little_endian]

[little_endian]: resources/litte_endian.png
