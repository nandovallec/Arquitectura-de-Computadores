#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
   #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv) { 
  int i, n=200,chunk,a[n],suma=0;
	int c;
	omp_sched_t k;
   if(argc < 3)     {
      fprintf(stderr,"\nFalta iteraciones o chunk \n");
      exit(-1);
     }
   n = atoi(argv[1]); if (n>200) n=200; chunk = atoi(argv[2]); 

   for (i=0; i<n; i++)       a[i] = i; 
 
   #pragma omp parallel num_threads(4)
	{
		#pragma omp for firstprivate(suma) lastprivate(suma) schedule(dynamic,chunk) 
		   for (i=0; i<n; i++){
				suma = suma + a[i];
				printf(" thread %d suma a[%d]=%d suma=%d \n",omp_get_thread_num(),i,a[i],suma);
				if(i==0){
					printf("Variable dyn-var: %s\n",omp_get_dynamic() ? "true" : "false");
					printf("Variable nthreads-var: %d\n",omp_get_max_threads());
					omp_get_schedule(&k, &c);
					if(k == omp_sched_static)
						printf("Variable run-sched-var: estatica, tamaño chunk: %d\n", c);
					else if(k == omp_sched_dynamic)
						printf("Variable run-sched-var: dinamica, tamaño chunk: %d\n", c);
					else
						printf("Variable run-sched-var: guided, tamaño chunk: %d\n", c);
				}
			}
		
	}  
  
	omp_set_dynamic(true);
	omp_set_num_threads(10);
	omp_set_schedule(omp_sched_static, 3);
	printf("Cambio las variables\n.");
	printf("Fuera de 'parallel' suma=%d\n",suma); 
	printf("Variable dyn-var: %s\n",omp_get_dynamic() ? "true" : "false");
	printf("Variable nthreads-var: %d\n",omp_get_max_threads());
	omp_get_schedule(&k, &c);
	if(k == omp_sched_static)
		printf("Variable run-sched-var: estatica, tamaño chunk: %d\n", c);
	else if(k == omp_sched_dynamic)
		printf("Variable run-sched-var: dinamica, tamaño chunk: %d\n", c);
	else
		printf("Variable run-sched-var: guided, tamaño chunk: %d\n", c);

   return(0);
}
