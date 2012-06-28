#include <iostream>
#include <cstdlib>
#include <list>

using namespace std;

int main(int argc, char *argv[]){
    int num = atoi(argv[1]);
    int byte = 0;
    cout << num << endl;

    list<int> intlist;

    do{
        intlist.push_back(num % 2);
        num = num / 2;
        if(num == 1){
            intlist.push_back(num);
        }
    }while(num > 1);

    int ARRAY_SIZE=intlist.size();
    int stack[ARRAY_SIZE];
    

    list<int>::iterator it = intlist.begin();
    int i = 0;
    while(it != intlist.end()){
        stack[i] = *it;
        it++;
        i++;
    }

    for(i=ARRAY_SIZE-1; i>=0;i--){
        cout << stack[i];
    }

    cout <<  endl;

    return 0;
}
