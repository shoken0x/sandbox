/* example1.c */
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
  i = 432;
  for (j = 12; j < 19; j++) {
    k = gcd(i,j);
    printf("G.C.D is %d.\n",k);
  }
  exit(0);
}
