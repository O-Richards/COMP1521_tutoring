#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <error.h>
#include <errno.h>
#include <assert.h>
#include <string.h>

int fd; // open file descriptor
int nb; // # bytes read
int ns = 0; // # spaces 
char buf[BUFSIZ]; // input buffer
int main(void) {
    fd = open("xyz",O_RDONLY);
    assert(fd >= 0);
    while ((nb = read(fd, buf, 1000)) > 0) {
        for (int i = 0; i < nb; i++)
            if (isspace(buf[i])) ns++;
    }
    close(fd);
}
