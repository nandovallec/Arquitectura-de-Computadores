#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la funcion printf()
#include <time.h> 
#include <omp.h>

//#define VECTOR_DYNAMIC    // descomentar para que los vectores sean variables ...
                   // dinamicas (memoria reutilizable durante la ejecucion)
#define VECTOR_GLOBAL


#ifdef VECTOR_GLOBAL
	#define MAX 1000         //=2^12
	double v1[MAX][MAX], v2[MAX][MAX], v3[MAX][MAX]; 
#endif

int main(int argc, char** argv){

int i,j, k; 
  struct timespec cgt1,cgt2;
	double ncgt; //para tiempo de ejecucion
 

  
  unsigned int N = 500; // Maximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

	//Inicializar vectores 

	  for(i=0; i<N; i++){
		for (j = 0 ; j<N; j++){
			v1[i][j] = N*0.1+j*0.1;
			v2[i][j] = N*0.1-i*0.1;
			v3[i][j] = 0;
		}
	  } 

double aux = 0;
	clock_gettime(CLOCK_REALTIME,&cgt1);

	for(i = 0; i < N; ++i){
		for(k = 0; k < N; ++k){

			for(j= 0; j < N; j=j+4){
				v3[i][j]  += (v1[i][k]*v2[k][j]);
				v3[i][j+1]  += (v1[i][k]*v2[k][j+1]);
				v3[i][j+2]  += (v1[i][k]*v2[k][j+2]);
				v3[i][j+3]  += (v1[i][k]*v2[k][j+3]);
			}
		}		
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	if(N<15){
		printf("V1\n");
		for (i = 0; i < N; i ++){
			for (j = 0; j < N; j++)
				printf("%f ", v1[i][j]);
			printf("\n");
		}
		printf("\nV2\n");
		for (i = 0; i < N; i ++){
			for (j = 0; j < N; j++)
				printf("%f ", v2[i][j]);
			printf("\n");
		}
		printf("\nV3\n");
		for (i=0; i<N; i++)
			for (j=0; j<N; j++)
				printf("V[%d][%d]=%f",i, j ,v3[i][j]);
		printf("\n");
	}


	printf("Tamaño: %d\n", N);
	printf("Tiempo(seg.):%11.9f\n",ncgt);
	printf("Resultado: v[0][0]=%f || v[%d][%d]=%f\n",v3[0][0],N-1, N-1,v3[N-1][N-1]);


}
