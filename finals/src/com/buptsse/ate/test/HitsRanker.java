package com.buptsse.ate.test;
/**
  * The implementation of Ranker based on hits algorithm.
  */
 public class HitsRanker implements Ranker {
     
     public double[] getRankVec(double[][] A) {
         return hitsIterate(A);
     }
 
     /** kernal of hits alogrithm*/
     public static double[] hitsIterate(double[][] B) {
         int len = B[0].length;
         double[][] L = MatrixHelp.matrixMultiply(B); //B*BT
 
         double[][] H = new double[2][len]; //hub
         double[][] A = new double[2][len]; //authority
         int now = 0;
         int other = 1;
         int temp;
 
         for (int i = 0; i < len; i++) {
             H[now][i] = A[now][i] = 1.0;
         }
         double threshould = 0.0000001;
         do {
             A[other] = MatrixHelp.matrixTransposeMultiplyVector(L, A[now]);
             H[other] = MatrixHelp.matrixMultiplyVector(L, H[now]);
             MatrixHelp.normal(A[other]);
             MatrixHelp.normal(H[other]);
             //swap now and other
             temp = now;
             now = other;
             other = temp;
         }while(MatrixHelp.normValue(MatrixHelp.subVec(H[now], H[other])) > threshould &&  
                MatrixHelp.normValue((MatrixHelp.subVec(A[now], A[other])))> threshould);
      
         double[] R = MatrixHelp.mergeVec(A[now], H[now]);
         MatrixHelp.normalize(R);
         return R;
     }
 }