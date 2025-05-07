#include <stdio.h>
#include <string.h>
#include "http3/http3.h"

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

    GoString addr = {"localhost:6121", len("localhost:6121")};
    GoString certGoString = {cert, len(cert)};
    GoString keyGoString = {key, len(key)};
    GoString wwwGoString = {www, len(www)};
    ListenAndServeTLS(addr, certGoString, keyGoString, wwwGoString);    

    return 0;
}