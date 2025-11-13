#include <stdio.h>
extern int suma(int,int);
extern int strlenn(char*);
int main(){
    int a=5,b=12;
    printf("El valor de la suma es %d\n",suma(a,b));
    printf("El tamaño de la cadena es %d\n",strlenn("Camarones"));
}
