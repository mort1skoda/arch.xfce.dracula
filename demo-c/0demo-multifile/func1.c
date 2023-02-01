#include "func1.h"
#include <stdio.h>

int func1(int x, int y){
	printf("inside: int func1(int x, int y)\n");

	int a;
	a = 0;
	a++;
	return x + y + a;
}

