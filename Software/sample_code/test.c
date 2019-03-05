#include <stdio.h>

int main(void) {
	char A[10];
	int x = 0;
	int i;

	for(i = 0; i < 10; i++) A[i] = i;
	for(i = 0; i < 10; i++) x += A[i];

	return 0;
}

