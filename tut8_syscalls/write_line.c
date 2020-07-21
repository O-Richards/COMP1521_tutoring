#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 1000

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("usage: %s file_name\n", argv[0]);
        return -1;
    }
    
    FILE *f = fopen(argv[1], "w");
    if (f == NULL) {
        perror("Error opening file");
        return -1;
    }

    // read a line from stdin
    char buf[BUF_SIZE];
    if(!fgets(buf, BUF_SIZE, stdin)) {
        perror("Error reading from stdin");
        return -1;
    }

    if (fputs(buf, f) == EOF) {
        perror("Error writing to file");
        return -1;
    }
    return 0;
}
