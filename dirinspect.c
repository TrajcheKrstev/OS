#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <sys/stat.h>


int main(int argc, char* argv[]){
    char* dirname;
    DIR* dir;
    if(argc == 1) dirname = ".";
    else dirname = argv[1];
    if ((dir = opendir(dirname)) == NULL) {
        perror("opendir");
        exit(EXIT_FAILURE);
    }
    struct dirent * entry;
    while((entry = readdir(dir)) != 0){
        struct stat sb;
        char type;
        char full_path[1024];
        snprintf(full_path, 1024, "%s/%s", dirname, entry->d_name);
        if (stat(full_path, &sb) == -1) {
            perror("stat");
            continue;
        }
        if (S_ISREG(sb.st_mode))
            type = '-';
        else if (S_ISDIR(sb.st_mode))
            type = 'd';
        else if (S_ISLNK(sb.st_mode))
            type = 'l';
        else if (S_ISFIFO(sb.st_mode))
            type = 'p';
        else if (S_ISSOCK(sb.st_mode))
            type = 's';
        else if (S_ISCHR(sb.st_mode))
            type = 'c';
        else if (S_ISBLK(sb.st_mode))
            type = 'b';
        else
            type = '?';

        printf("%10ld %c %s\n", (long) sb.st_ino, type, entry->d_name);
    }
    closedir(dir);
    return 0;
}