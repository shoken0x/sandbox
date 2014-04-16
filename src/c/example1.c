#include <stdio.h>
#include <stdlib.h>
int gcd(int a, int b){
   int c;
   while(b != 0){
     c = a%b;
     a = b;
     b = c; 
   }
  return a; 
}

int main(int argc, char *argv[]) {
  int i,j,k;
  i = 1000;
  j = 35;
  k = gcd(i,j);
  printf("G.C.D is %d.\n",k);
  exit(0);
}
