#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la funcion printf()
#include <time.h> 
#include <omp.h>

//#define VECTOR_DYNAMIC    // descomentar para que los vectores sean variables ...
                   // dinamicas (memoria reutilizable durante la ejecucion)
#define VECTOR_GLOBAL


#ifdef VECTOR_GLOBAL
	#define MAX 5700         //=2^12
	double v1[MAX][MAX], v2[MAX], v3[MAX]; 
#endif

int main(int argc, char** argv){

int i,j; 
  struct timespec cgt1,cgt2;
	double ncgt; //para tiempo de ejecucion
 
  //Leer argumento de entrada (n? de componentes del vector)
  if (argc<2){      
    printf("Faltan n? componentes del vector\n");
    exit(-1);
  }
  
  unsigned int N = atoi(argv[1]); // Maximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)

#ifdef VECTOR_DYNAMIC
  double *v1, *v2, *v3;
  v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamano en bytes
  v2 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
  v3 = (double*) malloc(N*sizeof(double));
    if ( (v1==NULL) || (v2==NULL) || (v3==NULL) ){      
    printf("Error en la reserva de espacio para los vectores\n");
    exit(-2);
  }
  #endif

	//Inicializar vectores 
#pragma omp parallel private(j)
{
	#pragma omp for
	  for(i=0; i<N; i++){
		v2[i] = N*0.1-i*0.1;
		v3[i] = 0;
		for (j = 0 ; j<N; j++){
			v1[i][j] = N*0.1+j*0.1;
		}
	  }
} 


	clock_gettime(CLOCK_REALTIME,&cgt1);
#pragma omp parallel private(j)
{
	#pragma omp for
	for(i = 0; i < N; i++){
		for(j= 0; j < N; j++){
			#pragma omp atomic
			v3[i] = v3[i] + v1[i][j]*v2[j];
		}
	}
}

	clock_gettime(CLOCK_REALTIME,&cgt2);
	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

	if(N<15){
		/*printf("V1\n");
		for (i = 0; i < N; i ++){
			for (j = 0; j < N; j++)
				printf("%f ", v1[i][j]);
			printf("\n");
		}
		printf("\nV2\n");
		for (i=0; i<N; i++)
			printf("%f", v2[i]);*/
		printf("\nV3\n");
		for (i=0; i<N; i++)
			printf("V[%d]=%f",i ,v3[i]);
		printf("\n");
	}

	printf("Tamaño: %d\n", N);
	printf("Tiempo(seg.):%11.9f\n",ncgt);
	printf("Resultado: v[0]=%f || v[%d]=%f\n",v3[0],N,v3[N-1]);

}
