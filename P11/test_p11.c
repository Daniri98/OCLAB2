#include <stdint.h>
#include <stdio.h>
extern void pBin8b(uint8_t);
extern void pBin16b(uint16_t);
extern void pBin32b(uint32_t);
extern void pBin64b(uint64_t);
int main(){
    uint8_t x=12;
    uint16_t dx=24452;
    uint32_t sdx=412423;
    uint64_t isdx=8423125723844123;
pBin8b(x);
printf("\n");
pBin16b(dx);
printf("\n");
pBin32b(sdx);
printf("\n");
pBin64b(isdx);
printf("\n");
}