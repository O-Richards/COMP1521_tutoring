#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char *value = getenv("HOME");
    char path[1000];
    snprintf(path, 1000, "%s/.diary", value);

    FILE *file = fopen(path, "r");

    if (file == NULL) {
        perror("opening diary: ");
        exit(-1);
    }

    char buf[1000];
    while (fgets(buf, 1000, file) != NULL) {
        fputs(buf, stdout);
    }
}
