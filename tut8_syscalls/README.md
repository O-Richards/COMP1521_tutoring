# Tutorial 8 - System Calls

## Introductions

What is a syscall?
    * A function which is provided by the kernel
Give some examples of a syscall:
    * Anything involving I/O or operating system
    * e.g. fopen(), printf(), scanf(), open(), lseek(), socket(), chmod(), ...

## man

How do we find out information about syscalls?

    1. What does fopen(3) do? What are its parameters?
    2. What are some circumstances when fopen(3) returns NULL?
    3. How do you print the specific reason that caused fopen(3) to return NULL?

## How do syscalls indicate they failed?

* Return value tells you success or failure
* If you want to know the exact reason for failure, you can consult the (global) errno
* Functions like perror() let you print a string then the last error message

## Example using syscalls

* see write\_line.c


## fopen() vs open()

* When should we use FILE * functions vs. the lower level file descriptor functions?
* fopen(), fscanf(), fputs() etc. deal with *text* files
* open(), write(), read() are at a lower level - they deal with *bytes*!
* Use fopen() etc. if you are dealing with strings, open() etc. if you want to deal with binary data

### open()

```C
int open(const char *pathname, int flags);
```

How do we construct the flags value?
* OR together individual flags (each flag is just one set bit)
* e.g. O\_APPEND | O\_CREAT | O\_WRONLY

See question 11

### File Descriptors

* open() returns a file descriptor (int) this is an index into the open file table that the OS maintains for the process
* Providing this file descriptor to subsequent sys calls e.g. write() tells them which (open) file to deal with

### lseek()

```C
    off_t lseek(int fd, off_t offset, int whence);                                                            
```

    1. What is its purpose?
    2. When would it be useful?
    3. What does its return value represent? 

    * Another part of that library - lseek - allows us to choose where we want to read/write to files
    * Usefull for files of structs
    * off_t lseek(int fd, off_t offset, int whence);
        * returns current offset (after the seek)
        * Provide file descriptor, how large a step we want to take and from where we want to step
            * SEEK_SET  -> start of file
            * SEEK_CURR -> current position
            * SEEK_END  -> end of file

Consider a file of size 10000 bytes, open for reading on file descriptor fd, initially positioned at the start of the file (offset 0). What will be the file position after each of these calls to lseek()? Assume that they are executed in sequence, and one will change the file state that the next one deals with.

```C
    lseek(fd, 0, SEEK_END);
    lseek(fd, -1000, SEEK_CUR);
    lseek(fd, 0, SEEK_SET);
    lseek(fd, -100, SEEK_SET);
    lseek(fd, 1000, SEEK_SET);
    lseek(fd, 1000, SEEK_CUR); 
```

## Question 14


If a file xyz contains 2500 bytes, and it is scanned using the following code:

```C
int fd;         // open file descriptor
int nb;         // # bytes read
int ns = 0;     // # spaces
char buf[BUFSIZ]; // input buffer

fd = open ("xyz", O_RDONLY);
assert (fd >= 0);
while ((nb = read (fd, buf, 1000)) > 0) {
	for (int i = 0; i < nb; i++)
		if (isspace (buf[i]))
			ns++;
}
close (fd);
```

Assume that all of the relevant #include's are done.

How many calls with be made to the read() function, and what is the value of nb after each call?
