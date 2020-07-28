#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
   struct stat sb;

   if (argc < 2) {
        fprintf(stderr, "Usage: %s <pathname>\n", argv[0]);
        exit(EXIT_FAILURE);
   }

   for (int i = 1; i < argc; i++) {
        const char *file_path = argv[i];
        struct stat sb;
        if (stat(file_path, &sb) == -1) {
            perror("stat");
            exit(EXIT_FAILURE);
        }

        mode_t curr_mode = sb.st_mode;
        if ((curr_mode & S_IWOTH) != 0) { // see man 7 inode
            // is publicly writable
            mode_t new_mode = curr_mode & (~S_IWOTH);
            chmod(file_path, new_mode);
            printf("Changed mode of %s\n", file_path);
        } else {
            printf("%s has no public write perm\n", file_path);
        }
   }

   return 0;
}
