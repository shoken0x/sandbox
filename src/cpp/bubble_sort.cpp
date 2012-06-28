#include <ctime>
#include <cstdlib>
#include <iostream>
using namespace std;

#define MIN 0
#define MAX 100
#define N 10

int main(int argc, char *argv[]){
    int sort[N];
    srand(time(NULL));

    cout << "Before\n";

    for(int i=0; i<N; i++){
        sort[i] = MIN + rand() % (MAX - MIN);
        cout << sort[i] << " ";
    }

    cout << "\n\n";
    cout << "After\n";

    //bubble sort
    int flag=0;
    int tmp=0;
    while(flag==0){
        flag = 1;
        for(int i=0; i<N; i++){
            if(i>0){
                if(sort[i]<sort[i-1]){
                    tmp = sort[i];
                    sort[i] = sort[i-1];
                    sort[i-1] = tmp;

                    flag = 0;
                }
            }
        }
    }


    for(int i=0; i<N; i++){
        cout << sort[i] << " ";
    }

    cout << endl;
    return 0;   
}
