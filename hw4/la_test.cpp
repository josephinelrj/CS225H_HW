#include <climits>
#include <chrono>
#include <iostream>
#include <omp.h>
#include <random>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cmath>
#include "la.h"


// #define RANDTOP INT_MAX
#define RANDTOP 10

int main(int argc, char *argv[])
{
	int n;
	double *A;
	double *B;
	double *C;
	double *a;
	double *b;
	double *c;
	double result;
	int resultloc;

	std::cout << "Running with OMP max threads = " << omp_get_max_threads() << std::endl;

	if(argc == 1){
		n = 4;
	
		A =(double *) malloc(sizeof(double)*n*n);
		B =(double *) malloc(sizeof(double)*n*n);
		C = (double *) malloc(sizeof(double)*n*n);

		for(int i=0; i < n; i++)
			for(int j=0; j < n; j++)
			{
				A[loc(i,j,n)] = i + j;
				B[loc(i,j,n)] = (i == j) ? 1 : 0;
				C[loc(i,j,n)] = 9;
			}

		printf("A = \n");
		printMatrix(A, n);
		printf("B = \n");
		printMatrix(B, n);
		printf("C = \n");
		printMatrix(C, n);
		printf("A * B = \n");
		matmul_openmp(A, B, C, n);
		printMatrix(C, n);

	} else if(argc == 2) {
		n = 1000;
		int testnumber = atoi(argv[1]);
		A = (double*) malloc(sizeof(double)*n*n);
		B = (double*) malloc(sizeof(double)*n*n);
		C = (double*) malloc(sizeof(double)*n*n);
		a = (double*) malloc(sizeof(double)*n);
		b = (double*) malloc(sizeof(double)*n);
		c = (double*) malloc(sizeof(double)*n);
		
		std::random_device rd;  // a seed source for the random number engine
		std::mt19937 gen(rd()); // mersenne_twister_engine seeded with rd()
		std::uniform_int_distribution<> randint(1, RANDTOP);


		for(int i=0; i < n; i++)
		{
			for(int j=0; j < n; j++)
			{
				A[loc(i,j,n)] = B[loc(i,i,n)] = i + 2 * j;
				C[loc(i,j,n)] = 9;
			}
			a[i] = randint(gen);
			b[i] = randint(gen);
			c[i] = randint(gen);
		}

		// test here
		// prefix(a, b, n);
		// printVector(a, n);
		// printVector(b, n);

        auto start{std::chrono::steady_clock::now()};
        auto end{std::chrono::steady_clock::now()};

        start = start = std::chrono::steady_clock::now();
        prefix_no_openmp(a, b, n);
        end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed_seconds_prefix_no_openmp{end - start};
        std::cout << "prefix_no_openmp time = " << elapsed_seconds_prefix_no_openmp.count() << "s\n";

        start = start = std::chrono::steady_clock::now();
        prefix_openmp(a, b, n);
        end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed_seconds_prefix_openmp{end - start};
        std::cout << "prefix_openmp time = " << elapsed_seconds_prefix_openmp.count() << "s\n";

        start = start = std::chrono::steady_clock::now();
        matmul_no_openmp(A, B, C, n);
        end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed_seconds_matmul_no_openmp{end - start};
        std::cout << "matmul_no_openmp time = " << elapsed_seconds_matmul_no_openmp.count() << "s\n";

        start = start = std::chrono::steady_clock::now();
        matmul_openmp(A, B, C, n);
        end = std::chrono::steady_clock::now();
        std::chrono::duration<double> elapsed_seconds_matmul_openmp{end - start};
        std::cout << "matmul_openmp time = " << elapsed_seconds_matmul_openmp.count() << "s\n";

        // printVector(a, n);
		// printVector(b, n);

	} else {
		std::cout << "This only takes the n dimension as an argument" << std::endl;
		return 1;
	}

	return 0;
}