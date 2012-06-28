#include <iostream>
#include "Cat.h"
using namespace std;

int main(){
    Cat cat;

    cat.age = 10;
    cat.height = 20;

    cout << cat.age << endl;
    cout << cat.height << endl;

    cat.cry();
    return 0;
}
