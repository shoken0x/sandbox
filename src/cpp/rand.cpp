#include <ctime>
#include <cstdlib>
#include <iostream>
using namespace std;

#define MIN 0
#define MAX 20
#define N 10

int main(int argc, char *argv[]){
    int sort[N];
    srand(time(NULL));

    for(int i=0; i<N; i++){
        sort[i] = MIN + rand() % (MAX - MIN);
        cout << sort[i] << " ";
    }
    cout << endl;
    return 0;   
}
