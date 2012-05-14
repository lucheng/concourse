package com.buptsse.ate.test;
/**
  * This class has all the independent caculations related to matrix and vector
  * that will be used in text sumarization.
  * Notice those fuctions for this paticular project useage, does not consider
  * more about reuse, the data type all use double and assume two dimessional 
  * matrix with same dinmenstion length(square matrix).
  */
 public class MatrixHelp {
    
     /** retrun squared distance of vector P1 and P2*/
     public static double distance(double[] P1, double[] P2) {
         int len = P1.length;  //P1.length must equal to P2.length 
         double sum = 0;
         for (int i = 0; i < len; i++)
             sum += (P1[i] - P2[i]) * (P1[i] - P2[i]);
         return sum;
     }
 
     /** say H = transpose([a,b,c]) normal H means let H = transpose([a,b,c]/sqrt(a^2+b^2+c^2))*/
     public static void normal(double[] P) {
         int len = P.length;  
         double sum = 0;
         for (int i = 0; i < len; i++)
             sum += P[i];
         for (int i = 0; i < len; i++)
             P[i] /= sum;
     }
 
     /** return value of ||P||*/ 
     public static double normValue(double[] P) {
         double sum = 0;
         for (int i = 0; i < P.length; i++)
             sum += Math.abs(P[i]);
         return sum;
     }
 
     /** sub return P1 - P2*/
     public static double[] subVec(double[] P1, double[] P2) {
         int len = P1.length;
         double[] Result = new double[len];
         for (int i = 0; i < len; i++)
             Result[i] = P1[i] - P2[i];
         return Result;
     }
 
     /** merge return (P1 + P2)/2.0*/
     public static double[] mergeVec(double[] P1, double[] P2) {
         int len = P1.length;
         double[] Result = new double[len];
         for (int i = 0; i < len; i++)
             Result[i] = (P1[i] + P2[i])/2.0;
         return Result;
     }
 
 
     /** normalize all the value in vec P to 0.001-0.0.9995*/
     public static void normalize(double[] P) {
         double dMaxValue = -1.0;
         double dMinValue = 2.0;
         int len = P.length;
         for (int i = 0; i < len; i++) {
             if (P[i] < dMinValue)
                 dMinValue = P[i];
             if (P[i] > dMaxValue)
                 dMaxValue = P[i];
         }
         if (dMaxValue - dMinValue < 0.0000001)
             return;
         for (int i = 0; i < P.length; i++) {
             if(P[i] <= (dMinValue*1.005)) //do not use boundary value
                 P[i]= dMinValue*1.005;
             if(P[i] >= (dMaxValue*0.995))
                 P[i] = dMaxValue*0.995;
             P[i]=(P[i]-dMinValue)/(dMaxValue-dMinValue);
             P[i] = ((0.5-0.001)/0.5)*P[i] + 0.001;
         }
     }
     /** return the result matrix of matrix A mutliply (transpose of A)*/ 
     public static double[][] matrixMultiply(double[][] A) {
         int len = A[0].length;
         double[][] Result = new double[len][len]; 
         for (int i = 0; i < len; i++)
             for (int j = 0; j < len; j++)
                 for (int k = 0; k < len; k++)
                     Result[i][j] += A[i][k] * A[j][k]; //A[i][k] * AT[k][j]
         return Result;
     }
 
     /** return the result matrix of matrix A mutliply matrix B,A and B of same dimention size*/ 
     public static double[][] matrixMultiply(double[][] A, double[][] B) {
         int len = A[0].length;
         double[][] Result = new double[len][len]; 
         for (int i = 0; i < len; i++)
             for (int j = 0; j < len; j++)
                 for (int k = 0; j < len; k++)
                     Result[i][j] += A[i][k] * B[k][j];
         return Result;
     }
     /** return the result vector of matrix A mutliply vector P*/ 
     public static double[] matrixMultiplyVector(double[][] A, double[] P) {
         int len = P.length;
         double[] Result = new double[len]; 
         for (int i = 0; i < len; i++)
             for (int j = 0; j < len; j++)
                 Result[i] += A[i][j] * P[j];
         return Result;
     }
 
     
     /** return the result vector  of first transposing matrix A than mutliply vector P*/ 
     public static double[] matrixTransposeMultiplyVector(double[][] A, double[] P) {
         int len = P.length;
         double[] Result = new double[len]; 
         for (int i = 0; i < len; i++)
             for (int j = 0; j < len; j++) {
                 Result[i] += A[j][i] * P[j];
             }
         
         return Result;
     }
 
     /** for debug show all matrix data value*/
     public static void printMatrix(double[][] A) {
         int len = A[0].length;
         for (int i = 0; i < len; i++) {
             for (int j = 0; j < len; j++) {
                 System.out.printf("%.2f", A[i][j]);
                 System.out.print(" ");
             }
             System.out.println("");
         }
     }
 
     /** for debug show all vector data value*/
     public static void printVector(double[] P) {
         for (int i = 0; i < P.length; i++)
              System.out.printf("%.2f", P[i]);
         System.out.println("\n");
     }
 }