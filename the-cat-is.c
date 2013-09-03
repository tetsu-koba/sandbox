// author: shigehiro fukase <shigehiro.fukase@gmail.com>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main()
{
	srandom(time(NULL));
	if (random() % 2) printf("Alive!\n");
	else printf("Dead!\n");
	return 0;
}
