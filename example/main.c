#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char* www = "";
    int tcp = 0;
    char* key = "";
    char* cert = "";
    for (int i=1; i<argc; i++) {
        if (argv[i] == "-www") {
            www = argv[i+1];
            continue;
        }
        if (argv[i] == "-tcp") {
            tcp = 1;
            continue;
        }
        if (argv[i] == "-key") {
            key = argv[i+1];
            continue;
        }
        if (argv[i] == "-cert") {
            cert = argv[i+1];
            continue;
        }
    }



    return 0;
}