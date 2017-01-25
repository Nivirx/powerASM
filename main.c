#include <stdlib.h>
#include <stdio.h>


extern int power(int base, int power);

int main() {

	printf("%d %d %d\n", 
		power(5,2),power(2,5),power(3,3));
	return 0;
}
