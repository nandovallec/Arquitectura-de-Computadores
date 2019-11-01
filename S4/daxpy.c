#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la funcion printf()
#include <time.h> 
#include<math.h>
#include <omp.h>


int main(int argc, char *argv[]){
	struct timespec cgt1,cgt2;
	double ncgt; //para tiempo de ejecucion
	int N = atoi(argv[1]);;
	double *x = (double*) malloc(N*sizeof(double));
  	double *y = (double*) malloc(N*sizeof(double));
	double a = 2.3;
	int i,j;
	
	
	for (i=0; i < N; i++){
		y[i] = (double)N*0.3-(double)i*0.5;
		x[i] = (double)N*0.3+(double)i*0.5;
	}
	clock_gettime(CLOCK_REALTIME,&cgt1);
	for (i=0;i<N;i++)
		y[i]= a*x[i] + y[i];

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

/*	printf("Tamaño: %d\n", N);
	printf("Tiempo(seg.):%11.9f\n",ncgt);
	printf("Resultado: v[0]=%f || v[%d]=%f\n",y[0],N-1,y[N-1]);
*/
	printf("%d %11.9f\n", N,(5*N)/(ncgt*pow(10,6)));
	
}
