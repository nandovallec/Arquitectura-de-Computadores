#include <stdlib.h> // biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h> // biblioteca donde se encuentra la funcion printf()
#include <time.h> 
#include <omp.h>

#define VECTOR_DYNAMIC    // descomentar para que los vectores sean variables ...
                   // dinamicas (memoria reutilizable durante la ejecucion)
//#define VECTOR_GLOBAL


#ifdef VECTOR_GLOBAL
	#define MAX 15000         //=2^12
	double v1[MAX][MAX], v2[MAX], v3[MAX]; 
#endif

int main(int argc, char** argv){

int i,j, k; 
  struct timespec cgt1,cgt2;
	double ncgt; //para tiempo de ejecucion
 
  //Leer argumento de entrada (n? de componentes del vector)
  if (argc<2){      
    printf("Faltan n? componentes del vector\n");
    exit(-1);
  }
  
  unsigned int N = atoi(argv[1]); // Maximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
  unsigned int M = atoi(argv[2]);

omp_set_num_threads(M);

#ifdef VECTOR_DYNAMIC
  double **v1 = (double**) malloc(N*sizeof(double*));
  double **v2 = (double**) malloc(N*sizeof(double*));
  double **v3 = (double**) malloc(N*sizeof(double*));
  for(i = 0; i < N; i++){
  	v1[i] = (double*) malloc(N*sizeof(double));// malloc necesita el tamano en bytes
	v2[i] = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
	v3[i] = (double*) malloc(N*sizeof(double));
	}
    if ( (v1==NULL) || (v2==NULL) || (v3==NULL) ){      
    printf("Error en la reserva de espacio para los vectores\n");
    exit(-2);
  }
  #endif
	//Inicializar vectores 

#pragma omp parallel for private(j) schedule(guided,20)
	  for(i=0; i<N; i++){
		for (j = 0 ; j<N; j++){
			v1[i][j] = N*0.1+j*0.1;
			v2[i][j] = N*0.1-i*0.1;
			v3[i][j] = 0;
		}
	  } 

double aux = 0;
	clock_gettime(CLOCK_REALTIME,&cgt1);

#pragma omp parallel for private(j) schedule(guided,20)
	for(i = 0; i < N; i++){
		for(j= 0; j < N; j++){
			for(k = 0; k < N; k++)
				v3[i][j] += (v1[i][k]*v2[k][j]);
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
	#ifdef VECTOR_DYNAMIC
	for(i=0; i < N; i++){
		free(v1[i]); // libera el espacio reservado para v1
		free(v2[i]); // libera el espacio reservado para v2
		free(v3[i]); // libera el espacio reservado para v3
	}
	#endif

	printf("Tamaño: %d\n", N);
	printf("Numero hebras: %d\n", M);
	printf("Tiempo(seg.):%11.9f\n",ncgt);
	printf("Resultado: v[0][0]=%f || v[%d][%d]=%f\n",v3[0][0],N-1, N-1,v3[N-1][N-1]);
	
	

}
