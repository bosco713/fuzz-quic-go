#include <stdio.h>
#include <string.h>
#include "http3/http3.h"

int main(int argc, char *argv[]) {
    char* www = "";
    int tcp = 0;
    char* key = "";
    char* cert = "";
    for (int i=1; i<argc; i++) {
	if (strcmp(argv[i], "-www") == 0) {
            www = argv[i+1];
            continue;
        }
	if (strcmp(argv[i], "-tcp") == 0) {
            tcp = 1;
            continue;
        }
	if (strcmp(argv[i], "-key") == 0) {
            key = argv[i+1];
            continue;
        }
	if (strcmp(argv[i], "-cert") == 0) {
            cert = argv[i+1];
            continue;
        }
    }

    GoString addr = {"localhost:6121", strlen("localhost:6121")};
    GoString certGoString = {cert, strlen(cert)};
    GoString keyGoString = {key, strlen(key)};
    GoString wwwGoString = {www, strlen(www)};
    ListenAndServeTLS(addr, certGoString, keyGoString, wwwGoString);    

    return 0;
}
