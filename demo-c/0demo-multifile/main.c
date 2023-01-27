#include <stdio.h>
#include "func1.h"
#include "func2.h"
#include "func3.h"

// Morten Håkestad 2023-01-15 15:15 - Sunday

int main(){
	printf("~/dev/  c/00template/main.c\n");
	printf("in f int main()\n");
	int ret;
	ret = 0;
	ret = func1(3, 6);
	printf("func1 returned: %d \n", ret);
	ret = func2(1,2,3);
	printf("func2 returned: %d \n", ret);
 	ret = func3(5);
	printf("func3 returned: %d \n", ret);

    typedef int* int_p;
    int a = 0;
    a++;

    int_p  p_a = &a;

    *p_a = 5;


	return 0;
}

