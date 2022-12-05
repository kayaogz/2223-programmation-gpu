#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <vector>
#include <ctime>
#include "cuda.h"
#include <cfloat>

#define BLOCKSIZE 1024

/**
  * Version 1: Ecrire un kernel GPU 1D qui trouve l'element minimum d'un tableau dA[N] pour chaque bloc et ecrit le minimum de chaque bloc dans une case de dAmin. En suite, CPU reprend dAmin et calcul le minimum global en sequentiel sur ce petit tableau.
  *
  * Version 2: Le premier appel au findMinimum reduit la taille du tableau a parcourir en sequentiel a N/BLOCKSIZE. Dans cette version, utiliser findMinimum deux fois a la suite afin de reduire la taille du tableau a parcourir en sequentiel a N/(BLOCKSIZE*BLOCKSIZE) (pour que la partie sequentielle en CPU devient vraiment negligable).
  *
  * Pour trouver le minimum des deux flottants en GPU, utiliser la fonction fminf(x, y)
  */

__global__ void findMinimum(float *dA, float *dAmin, int N)
{
  __shared__ volatile float buff[BLOCKSIZE];
  int idx = threadIdx.x + blockIdx.x * BLOCKSIZE;
  // A FAIRE ...
}

using namespace std;

int main()
{
  srand(1234);
  int N = 100000000;
  int numBlocks;// = ???; (A FAIRE ...)
  float *A, *dA; // Le tableau dont minimum on va chercher
  float *Amin, *dAmin; // Amin contiendra en suite le tableau reduit par un facteur de BLOCKSIZE apres l'execution du kernel GPU

  // Allour les tableaux A[N] et Amin[numBlocks] de maniere ``pined'' sur le CPU
  // Allouer les tableaux dA[N] et dAmin[numBlocks] sur le GPU
  // A FAIRE ...

  // Initialiser le tableau A
  for (int i = 0; i < N; i++) { A[i] = (float)(rand() % 1000); }
  A[rand() % N] = -1.0; // Mettre le minimum a -1.

  // Mettre A sur le GPU (dA) avec memcpy
  // A FAIRE ...

  float minA = FLT_MAX; // Affecter le maximum float a minA
  // Trouver le minimum du tableau dA, mettre dAmin dans le CPU, puis trouver le minimum global et le mettre dans la variable minA
  // A FAIRE ...
  // findMinimum<<<...>>>(...)
  // ...

  // Verifier le resultat
  if (minA == -1) { cout << "The minimum is correct!" << endl; }
  else { cout << "The minimum found (" << minA << ") is incorrect (it should have been -1)!" << endl; }

  return 0;
}
