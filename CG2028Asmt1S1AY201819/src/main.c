#include "stdio.h"

extern int pdm(int* base, int ncol, int index);

// CG2028 Assignment 1, Sem 1, AY 2018/19
// (c) CK Tham, ECE NUS, 2018

// Dimension of confusion matrix, i.e. MxM square matrix
// Note: pdm() must work for different values of M, e.g. M=10
#define M 9

float pdmTest(int *CM, int size, int index){
	int x;
	int store = 0, store2 = 0;
	for(x = 0; x < size; x++){
		if(x == index) store = *(CM + size * (index) + x);
		store2 += *(CM + size * (index) + x);
		//printf("%d ", *(CM + size * (index) + x));
	}
	//printf("\n");
	return store/(float)store2;
}

int main(void)
{
	// Variable definitions
	int index;
	// Note: different initialisation list is needed for different M
	int CM[M][M]= {42, 8, 169, 179, 10, 240, 223, 248, 140, 55, 221, 11, 45, 2, 40, 49, 33, 229, 105, 180, 181, 1, 25, 73, 69, 184, 42, 111, 190, 53, 171, 27, 103, 245, 6, 103, 107, 216, 124, 114, 140, 234, 21, 41, 106, 13, 145, 127, 174, 110, 89, 203, 214, 95, 35, 153, 119, 82, 150, 186, 24, 155, 86, 18, 149, 99, 102, 244, 221, 126, 43, 47, 232, 68, 221, 31, 198, 114, 201, 168, 195};
	// PDm: Call assembly language function pdm() for each class m
	// note: index = m - 1
	for (index=0; index<M; index++ )
		printf("%f %f\n", pdm((int*)CM, M, index)/10000.0, pdmTest(CM, M, index));

	// Enter an infinite loop, just incrementing a counter
	volatile static int loop = 0;
	while (1) {
		loop++;
	}
}



