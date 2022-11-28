/**
  * In this exercise, we will implement GPU kernels for computing the average of 9 points on a 2D array.
  * Dans cet exercice, nous implantons un kernel GPU pour un calcul de moyenne de 9 points sur un tableau 2D.
  *
  * Kernel 1: Use 1D blocks, no additional threads (1 thread per block)
  * Kernel 1: Utiliser blocs de 1D, pas de threads (1 thread par bloc)
  *
  * Kernel 2: Use 2D blocks, no additional threads (1 thread per block)
  * Kernel 2: Utiliser blocs de 2D, pas de threads (1 thread par bloc)
  *
  * Kernel 3: Use 2D blocks and 2D threads, each thread computing 1 element of Aavg
  * Kernel 3: Utiliser blocs de 2D, threads de 2D, chaque thread calcule 1 element de Aavg
  *
  * Kernel 4: Use 2D blocks and 2D threads, each thread computing 1 element of Aavg, use shared memory
  * Kernel 4: Utiliser blocs de 2D, threads de 2D, , chaque thread calcule 1 element de Aavg, avec shared memory
  *
  * Kernel 5: Use 2D blocks and 2D threads, use shared memory, each thread computes KxK elements of Aavg
  * Kernel 5: Utiliser blocs de 2D, threads de 2D, avec shared memory et KxK ops par thread
  *
  * For all kernels: Make necessary memory allocations/deallocations and memcpy in the main.
  * Pour tous les kernels: Effectuer les allocations/desallocations et memcpy necessaires dans le main.
  */

#include <iostream>
#include <cstdio>
#include "cuda.h"
#include "omp.h"

#define N 1024
#define K 4
#define T 128

// The matrix is stored by rows, that is A(i, j) = A[i + j * N]. The average should be computed on Aavg array.
// La matrice A est stockee par lignes, a savoir A(i, j) = A[i + j * N]
float *A;
float *Aavg;

// Reference CPU implementation
// Code de reference pour le CPU
void ninePointAverageCPU(const float *A, float *Aavg)
{
  for (int i = 1; i < N - 1; i++) {
    for (int j = 1; j < N - 1; j++) {
      Aavg[i + j * N] = (A[i - 1 + (j - 1) * N] + A[i - 1 + (j) * N] + A[i - 1 + (j + 1) * N] +
          A[i + (j - 1) * N] + A[i + (j) * N] + A[i + (j + 1) * N] +
          A[i + 1 + (j - 1) * N] + A[i + 1 + (j) * N] + A[i + 1 + (j + 1) * N]);
    }
  }
}


int main()
{
  A = (float *) malloc (N * N * sizeof(float));
  Aavg = (float *) malloc (N * N * sizeof(float));

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      A[i + j * N] = (float)i * (float)j;
    }
  }

  free(A);
  free(Am);

  return 0;
}