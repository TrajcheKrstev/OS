#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char* argv[]) {
    int inp, out, stBajtov;
    char vhod[1000];

    if(argc == 1 || argv[1][0] == '-'){
        inp = 0;
    }else {
        inp = open(argv[1], O_RDONLY);
        if(inp == -1){
            int koda = errno;
            perror("Napaka pri odpiranju vhodne datoteke");
            exit(koda);
        }
    }

    if(argc == 3){
        out = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC);
        if(out == -1){
            int koda = errno;
            perror("Napaka pri odpiranju izhodne datoteke");
            exit(koda);
        }
    }else{
        out = 1;
    }

    while((stBajtov = read(inp, vhod, 1000)) > 0){
        if(write(out, vhod, stBajtov) != stBajtov){
            int koda = errno;
            perror("Napaka pri kopiranju");
            exit(koda);
        }
    }
    if(stBajtov == -1){
        int koda = errno;
        perror("Napaka pri branju");
        exit(koda);
    }

    if(inp != 0){
        if(close(inp) == -1){
        int koda = errno;
        perror("Napaka pri zapiranju vhodne datoteke");
        exit(koda);
        }
    }

    if(out != 1){
        if(close(out) == -1){
        int koda = errno;
        perror("Napaka pri zapiranju izhodne datoteke");
        exit(koda);
        }
    }
    return 0;
}