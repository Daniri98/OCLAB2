#include <stdio.h>
extern int suma(int,int);
extern int strlenn(char*);
extern int getBit(int,int);
int main(){
    int a=5,b=12,c=127,numbit;
    printf("El valor de la suma es %d\n",suma(a,b));
    printf("El tamaño de la cadena es %d\n",strlenn("Camarones"));
    do{
    printf("Introdusca el bit al que quiere acceder del (0 al 31) del numero %d\n",c);
    scanf("%d",&numbit);
    }while(numbit<0 || numbit>31);
    printf("El bit en la posicion %d es %d del numero %d\n",numbit,getBit(c,numbit),c);
}
