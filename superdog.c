#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char* argv[]){
    char* filename;
    if(argc < 2){
        filename = "/etc/shadow";
    }else filename = argv[1];
    int fd = open(argv[1], O_RDONLY);
    if (fd == -1) {
        perror("open");
        exit(EXIT_FAILURE);
    }
    char buf[4096];
    int cnt;
    printf("UID: %d\n", getuid());
    printf("EUID: %d\n", geteuid());
    while((cnt = read(fd,buf,4096)) > 0){
        write(1, buf, cnt);
    }
    close(fd);
}