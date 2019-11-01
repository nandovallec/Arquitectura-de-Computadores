// struct.cc
#include <stdio.h>
#include <functional>
#include <numeric>
#include <stdlib.h> 
#include <time.h>

const int N = 5000, REP = 40000;


struct  S
{
	int a;
	int b;
} s[5000];

int main()
{
	int R[REP];
	int X1, X2;
	srand(time(NULL));
	struct timespec cgt1,cgt2;
	double ncgt;

	for(int i = 0; i < 5000; i++){
		s[i].a=i;	
		s[i].b=i;
	}
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (int ii = 0; ii < 40000; ++ii)
	{
		X1 = 0; X2=0;

		for (int i = 0; i < 5000; ++i)
			X1 = 2 * s[i].a + ii;

		for (int i = 0; i < 5000; i++)
			X2 = 3 * s[i].b - ii;

		if (X1 < X2)
			R[ii] = X1;
		else
			R[ii] = X2;
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Valor es %d\n", std::accumulate(R, R + REP, 0));
	printf("Tiempo(seg.):%11.9f\n",ncgt);
	return 0;
}
