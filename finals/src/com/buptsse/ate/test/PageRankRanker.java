package com.buptsse.ate.test;
/**
  * The implementaion of Ranker based on pagerank algorithm.
  */
 public class PageRankRanker implements Ranker {
     
     public double[] getRankVec(double[][] A) {
         return  pageRankIterate(getInitMatrix(A), 0.85);  
     }
 
      
     /** 
      * Kernal of page rank iterate 
      * Taking A as input matrixand d(damping factor,use 0.85 will be ok) 
      * and return the result vector with weight value
      * for each sentence
      */
     public static double[] pageRankIterate(double[][] A, double d) {
         int len = A[0].length;
         double[][] P= new double[2][len];
         int now = 0;
         int other = 1;
         int temp;
         for (int i = 0; i < len; i++)
             P[now][i] = 1.0/len;
         
         double threshould = 0.0000001;  //spell wrong?
         do {
             P[other] = MatrixHelp.matrixMultiplyVector(A, P[now]);
             for (int i = 0; i < len; i++)
                 //P[other][i] = d * P[other][i] + (1 - d);
                 P[other][i] = d * P[other][i] + (1 - d);
             temp = now;
             now = other;
             other = temp;
         } while(MatrixHelp.distance(P[now], P[other]) > threshould);
 
         MatrixHelp.normalize(P[now]);
         return P[now];
     }
 
    /**
     * Get the init matrix for ranker to use based
     * on input weight matrix A.
     */
     private static double[][] getInitMatrix(double[][] A) {
         int len = A[0].length;
         double[][] B = new double[len][len];
         //for page rank init matrix
         double weightSum;
         for (int j = 0; j < len; j++) {
             weightSum = 0.0;
             for(int k = 0; k < len; k++) {
                 //weightSum += A[k][j];
                 weightSum += A[j][k];
             }
             for (int i = 0; i < len; i++) {
                 if (weightSum > 0.0000001) {
                     B[i][j] = A[i][j] / weightSum;
                     //B[i][j] = A[j][i] /weightSum;
                 } else if (i == j) {
                     B[i][j] = 0.0;
                 } else {
                     B[i][j] = 1.00/(len - 1);
                 }
             }
         }
         return B;
     }
 
 }