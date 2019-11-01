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
	int X1, X2, X3, X4, X5, X6,X7,X8;
	srand(time(NULL));
	struct timespec cgt1,cgt2;
	double ncgt;

	for(int i = 0; i < N; i++){
		s[i].a=i;	
		s[i].b=i;
	}
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (int ii = 0; ii < REP; ++ii)
	{
		X1 = 0; X2=0; X3=0; X4=0; X5=0; X6=0;X7=0;X8=0;

		for (int i = 0; i < N; i=i+4){
			X1 = 2 * s[i].a + ii;
			X2 = 3 * s[i].b - ii;
			X3 = 2 * s[i+1].a + ii;
			X4 = 3 * s[i+1].b - ii;
			X5 = 2 * s[i+2].a + ii;
			X6 = 3 * s[i+2].b - ii;
			X7 = 2 * s[i+3].a + ii;
			X8 = 3 * s[i+3].b - ii;

		}
		X1+=X3+X5+X7;
		X2+=X4+X6+X8;
		R[ii]= X1;
		if(X2<X1)
			R[ii]=X2;
	}
	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	printf("Valor es %d\n", std::accumulate(R, R + REP, 0));
	printf("Tiempo(seg.):%11.9f\n",ncgt);
	return 0;
}
