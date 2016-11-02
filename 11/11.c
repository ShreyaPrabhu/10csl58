#include <stdio.h>
#include <omp.h>

//Compile using cc -fopenmp 11.c

int fib(int n){
	int i,j;
	if(n < 2)	return n;
	else{
		#pragma omp task shared(i)firstprivate(n)
		i = fib(n-1);
		#pragma omp task shared(j)firstprivate(n)
		j = fib(n-2);
		#pragma omp taskwait
		return (i+j);
	}
}

int main(){
	int i,n;
	printf("\nEnter the series length: ");
	scanf("%d",&n);
	omp_set_num_threads(4);
	for(i=0;i<n;++i){
		#pragma omp parallel shared(n)
		{
			#pragma omp single
			printf("%d ", fib(i));
		}
	}
}
