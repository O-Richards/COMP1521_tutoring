# Tutorial 4 - MIPS Assembly

## Registers:
    * What is the difference between $t1, $s1, $v0 and $a0
    * How are these all used?
    * What is the difference between memory and registers?
    * What operations can be done on a variable in a register vs. in memory


## Operations
    * Lots of operations you can perform on the registers
    * e.g. add, addi, mul, mod, ...
    * What is an immediate?
    * Operations can *only* be applied to registers, not directly to RAM!

## Labels
    * Labels are addresses! i.e. a pointer!
    * Can be a pointer to a constant/global variable (int the .data segment)
    * Can be a pointer to an instruction (in the .text segment)

Making global variables:

```C
    .data # globals are in data segment of memory!
    HELLO_WORLD:    # The label
        .asciiz "Hello World"   # Allocates memory
                                # .asciiz means we want to put a NULL terminated string here
                                # Lots of other assembler directives we can use too!

    global_x:                   # Make a global int = 23
        .word 23                

    # If we want to change our globals, we need to:
    #   1. Load the global into a register
    #   2. Apply operations on the register
    #   3. Save the result back to memory (at the label
    # For example, to do global_x++;
    lw  $t0, (global_x)
    addi $t0, $t0, 1
    sw  $t0, (global_x)
```

## Branching
    * How we implement conditional logic, and while statements
    * We jump our program's execution to some label e.g.

```C
    int x = 5;
    if (x == 5) {
        x = 10;
    }
```

```
    # x = $t0
    li  $t0, 5

    li  $t1, 5
    bne $t0, $t1, if_end
if:
    li  $t0, 10
if_end:
```

    * Always write out your labels + structure first then fill in the logic!
    * General approach to conditional statements:
        * Have a label for the `if` and the `else`
        * Calculate the negation of the conditional statement in C
        * Branch to the else if true
