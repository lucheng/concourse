package com.buptsse.ate.test;
/**
  * The class for getting user command and
  * parse the command to set up aprropritae
  * Sumarizer who will finish the job of ranking the
  * importance of all the input file sentences ,
  * sort sentences based on that and then
  * write to the output file.
  */
 public class TestSummarizer {
     
     public static void main(String[] args) {
         
//    	 args[0] = "-pagerank";
//    	 args[1] = "/finals/input/input/100049.txt";
//    	 args[2] = "/finals/input/output/summarizer.txt";
    	 
         String rankMethod = args[0];
         String inputFile = args[1];
         String outputFile = args[2];
         //TODO warning not supported method
         Ranker ranker;
         if (rankMethod.equals("-pagerank")) {
             ranker = new PageRankRanker();
         } else if (rankMethod.equals("-hits")) {
             ranker = new HitsRanker();
         } else {
             System.out.println("Not -pagerank or -hits use -pagerank");
             ranker = new PageRankRanker();
         }
         Summarizer summarizer = new Summarizer(inputFile, outputFile, ranker);
         summarizer.fileSummarize();
     }
 } //end of class TestSumarizer