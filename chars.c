#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    int n;
    if(argc < 2) n = 10;
    else n = atoi(argv[1]);
    int otroci[n];

    for (int i = 0; i < n; i++) {
        int pid = fork();

        if (pid < 0) {
            perror(argv[0]);
        } else if (pid == 0) {
            for (int j = 0; j < 42; j += i + 1) {
                printf("%c\n", 'A' + i);
                sleep(1 + i);
            }
            exit(i);
        } else { 
            otroci[i] = pid;
        }
    }

    for (int i = 0; i < 10; i++) {
        printf("*\n");
        sleep(1);
    }

    for (int i = 0; i < n; i++) {
        waitpid(otroci[i], NULL, 0);
    }

    printf("Samo brez panike\n");
    exit(42);
}
