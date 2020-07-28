# Assignment 2 Tips (smips)

3. Discuss strategies for decoding instructions for the assignment.

| Assembler  |	C | 	Bit Pattern |
| --- | --- | --- |
| add $d, $s, $t | 	d = s + t | 	000000ssssstttttddddd00000100000 |
| sub $d, $s, $t  |	d = s - t | 	000000ssssstttttddddd00000100010 |
| and $d, $s, $t  |	d = s & t | 	000000ssssstttttddddd00000100100 |
| or $d, $s, $t  |	d = s | t | 	000000ssssstttttddddd00000100101 |
| slt $d, $s, $t | 	d = 1 if s < t else 0 | 	000000ssssstttttddddd00000101010 |
| mul $d, $s, $t  |	d = s * t | 	011100ssssstttttddddd00000000010 |
| beq $s, $t, I 	 |if (s == t) PC += I | 	000100ssssstttttIIIIIIIIIIIIIIII |
| bne $s, $t, I  |	if (s != t) PC += I | 	000101ssssstttttIIIIIIIIIIIIIIII |
| addi $t, $s, I | 	t = s + I | 	001000ssssstttttIIIIIIIIIIIIIIII |
| slti $t, $s, I  |	t = (s < I) | 	001010ssssstttttIIIIIIIIIIIIIIII |
| andi $t, $s, I  |	t = s & I | 	001100ssssstttttIIIIIIIIIIIIIIII |
| ori $t, $s, I  |	t = s | I | 	001101ssssstttttIIIIIIIIIIIIIIII |
| lui $t, I  |	t = I << 16 | 	00111100000tttttIIIIIIIIIIIIIIII |
| syscall | 	syscall | 	00000000000000000000000000001100 |

Instructions have the format:

* Could have a set of bit masks for each instruction to remove the variable parts
    * Then compare the masked instruction with the OpCode for the instruction

e.g. for add

|    |     |
|--- | --- |
| Instruction | 000000ssssstttttddddd00000100000 |
| OpCode Mask | 11111100000000000000011111111111 |
| OpCode      | 00000000000000000000000000100000 |

* You could make your program logic simpler by considering the ways the instructions are divided up

\<opcode1\>\<s or opcode2\>\<t or opcode3 or I1\>\<d or opcode4 or I2\>\<opcode 5 or I3\>

## Question 4

1. convert 0x136bfffa to binary
2. divide up into |6 bits|5 bits|5 bits| rest|
3. try to match to an opcode
4. interpret the parts!

To check: 
1521 smips 
enter in the hex + press ctrl+d

# Filesystems

## Question 6

```C
struct stat {
	ino_t st_ino;         /* inode number */
	mode_t st_mode;       /* protection */ /* unsigned int */
	uid_t st_uid;         /* user ID of owner */
	gid_t st_gid;         /* group ID of owner */
	off_t st_size;        /* total size, in bytes */
	blksize_t st_blksize; /* blocksize for filesystem I/O */
	blkcnt_t st_blocks;   /* number of 512B blocks allocated */
	time_t st_atime;      /* time of last access */
	time_t st_mtime;      /* time of last modification */
	time_t st_ctime;      /* time of last status change */
};
```

