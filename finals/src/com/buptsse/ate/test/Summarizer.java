package com.buptsse.ate.test;
//import java.util.regex.*;
 
 import java.util.*;
 import java.io.*;
 import java.text.*;
 
 //to do how to split also consider ?
 
 
 
 /**
 
  * Summarizer is on charge of caculating 
 
  * a Matrix A, with A[i][j] represents
 
  * the overlap of sentence i and j.
 
  * It will than send the Matrix A to a
 
  * Ranker who will caculate all the sentence's
 
  * importance value and send back to Summarizer.
 
  * Summarizer will sort sentences based on
 
  * their importance value and write the reult
 
  * to file.
 
  *
 
  * Summarizer is also on charge of spliting doucument
 
  * content to sentences and split each sentence to
 
  * words.
 
  */
 
 public class Summarizer {
 
    
 
     /** 
 
      * Define Sentence type, it will record the sentence's 
 
      * start and end postion in fileContentString.
 
      * Also will record the word number in this sentence.
 
      */
 
     private class Sentence {
 
         public int start;
 
         public int end;
 
         public int wordNum;
 
     }
 
 
 
     /** Store which rank aloritm to use*/
 
     private final Ranker ranker;
 
     /** Store the name of output file*/
 
     private final String outputFileName;
 
     /** The whole file content is stored as a string here*/
 
     private final String fileContentString;
 
     /** sotre all the sentences info*/
 
     private final List<Sentence> sentenceList =  new ArrayList<Sentence> ();;
 
     /** the dfault stop words we will use*/
 
     private final static String stopWords[] = 
 
         {"a", "about", "an", "and", "are", "as", "at", "be", "but", "by",
 
          "for", "has", "have", "he", "his", "her", "in", "is", "it", "its",
 
          "of", "on", "or", "she", "that", "the", "their", "they", "this",
 
          "to", "was", "which", "who", "will", "with", "you"};
 
     private final Map<String, String> hmStopWord = new HashMap<String, String> ();
 
    
 
    /**
 
     * Construct of a summarizer 
 
     * Client must provide the inputFileName to sumarize
 
     * and the aimed outputFileName to output,
 
     * Clent also has to choose wich ranker algorithm to use,eg. 
 
     * Summarizer will also get stop words hashing map table set up.
 
     */
 
     public Summarizer(String inputFileName, String outputFileName, Ranker ranker) {
 
         this.outputFileName = outputFileName;
 
         this.fileContentString = readFileToString(inputFileName);
 
         this.ranker = ranker;
 
         initStopWordsMap();
 
     }
 
     /**
 
     * The only interface user can see currently, 
 
     * to sumarize a given file using ranker provided rank algorithm
 
     */
 
     public void fileSummarize() {
 
         initSentenceList();  //first spilit doucument to sentences using BreakIterator 
 
         double[][] A = getSetencesWeightMatrix(); //caculate the wight matrix using overlap score of sentences pair
 
         double[]P = ranker.getRankVec(A); //caculate each sentence importance value
 
         sortAndWriteFile(P); //sort and ouput the sorted sentences
 
     }
 
 
 
     //below are all internal private functions 
 
 
 
     /**
 
      * Caculate the total sentece num and store each sentence 
 
      * info to sentencesList(start, end)
 
      */
 
     private void initSentenceList() {
 
         
 
//         Locale currentLocale = new Locale("en", "US");
         Locale currentLocale = new Locale("zh", "CN");
 
         BreakIterator sentenceIter = BreakIterator.getSentenceInstance(currentLocale); 
 
         sentenceIter.setText(fileContentString);
 
         
 
         int start = sentenceIter.first();
 
         int end = sentenceIter.next();
 
         while (end != sentenceIter.DONE) {
 
             Sentence sentence = new Sentence();
 
             sentence.start = start;
 
             if (fileContentString.charAt(end - 1) == '\n') //we will eliminate the \n if a sentece has
 
                 sentence.end = end - 1;     //[)
 
             else
 
                 sentence.end = end;
 
             sentenceList.add(sentence);
 
             start = end;
 
             end = sentenceIter.next();
 
         }
 
     }
 
    
 
     /** 
 
      * Init of stop words hash map
 
      */
 
     private void initStopWordsMap() {
 
         for (int i = 0; i < stopWords.length; i++) 
 
             hmStopWord.put(stopWords[i], null);
 
     }
 
 
 
     /** 
 
      * This is the key function of Summarizer
 
      * It will caculate the overlap value 
 
      * for each pair of sentences
 
      */
 
     private double[][] getSetencesWeightMatrix( ) {
 
         
 
         Map<String, List<Integer> > hm = new HashMap<String, List<Integer> >();
 
         int sentenceNum = sentenceList.size();
 
         double[][] A = new double[sentenceNum][sentenceNum];
 
         //deal with all the words in each sentence
 
         Locale currentLocale = new Locale("zh", "CN");
//         Locale currentLocale = new Locale("en", "US");
 
         BreakIterator wordIter = BreakIterator.getWordInstance(currentLocale);
 
         
 
         //we do the process twice one forward and one reverse 
 
         //only for the case of repated words in one sentence
 
         //we suppose overlap(i, j) = overlap(j, i)
 
         //if setentce i is "above above ok" sentence j is "above above wrong"
 
         //the overlap is 2 , if sentence j is "above wrong" the overlap is 1.
 
         for (int i = 0; i < sentenceNum; i++) {
 
             Sentence sentence = sentenceList.get(i);
 
             wordIter.setText(fileContentString.substring(sentence.start, sentence.end));
 
              
 
             int start = wordIter.first();
 
             int end = wordIter.next();
 
             int wordNum = 0; 
 
             while (end != wordIter.DONE) {
 
                 String word = fileContentString.substring(sentence.start + start, sentence.start + end);
 
                 if (Character.isLetterOrDigit(word.charAt(0))) {
 
                     wordNum++; //ok, find legal word
 
 
 
                     String token = parseString(word);
 
                     if (hmStopWord.containsKey(token)) {
 
                         start = end;
 
                         end = wordIter.next();
 
                         continue;
 
                     }
 
                     List<Integer> list; 
 
                     if (hm.containsKey(token)) {
 
                         list = hm.get(token);
 
                         int flag = 0;
 
                         for (int j : list) {
 
                             if (i > j)
 
                                 A[i][j] += 1.0;
 
                             else
 
                                 flag = 1;
 
                         }
 
                         if (flag == 0)
 
                             list.add(i);
 
                     } else {
 
                         list = new LinkedList<Integer> ();
 
                         list.add(i);
 
                         hm.put(token, list);
 
                     }
 
                 }
 
                 start = end;
 
                 end = wordIter.next();
 
             }
 
             sentence.wordNum = wordNum;
 
         }
 
         
 
          hm.clear();
 
 
 
         for (int i = sentenceNum - 1; i >= 0; i--) {
 
             Sentence sentence = sentenceList.get(i);
 
             wordIter.setText(fileContentString.substring(sentence.start, sentence.end));
 
              
 
             int start = wordIter.first();
 
             int end = wordIter.next();
 
             while (end != wordIter.DONE) {
 
                 String word = fileContentString.substring(sentence.start + start, sentence.start + end);
 
                 if (Character.isLetterOrDigit(word.charAt(0))) {
 
                     //ok,find a legal word
 
                     String token = parseString(word);
 
                     if (hmStopWord.containsKey(token)) {                       
 
                         start = end;
 
                         end = wordIter.next();
 
                         continue;
 
                     }
 
                     List<Integer> list; 
 
                     if (hm.containsKey(token)) {
 
                         list = hm.get(token);
 
                         int flag = 0;
 
                         for (int j : list) {
 
                             if (i < j)
 
                                 A[i][j] += 1.0;
 
                             else
 
                                 flag = 1;
 
                         }
 
                         if (flag == 0)
 
                             list.add(i);
 
 
 
                     } else {
 
                         list = new LinkedList<Integer> ();
 
                         list.add(i);
 
                         hm.put(token, list);
 
                     }
 
                 }
 
                 start = end;
 
                 end = wordIter.next();
 
             }
 
         }
 
         
 
         //make sure overlap(i, j) = overlap(j, i) when not considering length
 
         for (int i = 0; i < sentenceNum; i++) {
 
             for (int j = 0; j > i && j < sentenceNum; j++) {
 
                 if (A[i][j] > A[j][i])
 
                     A[i][j] = A[j][i];
 
             }
 
         }
 
         
 
         //divide by sentence lenght to avoid promoting long sentences
 
         for (int i = 0; i < sentenceNum; i++) {
 
             for (int j = 0; j < sentenceNum; j++) {
 
                 if (A[i][j] > 0 && sentenceList.get(i).wordNum > 0)
 
                     A[i][j] /= sentenceList.get(i).wordNum;
 
             }
 
         }
 
         
 
         return A;
 
     }
 
     
 
     /** Read the whole input file content*/
 
     private static String readFileToString(String infile) {
 
         try {
 
             BufferedReader reader = new BufferedReader(new FileReader(infile));
 
             String result ="";
 
             String line = reader.readLine();
 
             while (line != null) {
 
                 result = result + line + '\n';
 
                 line = reader.readLine();
 
             }
 
             reader.close();
 
             return result;
 
         } catch(IOException ex) {
 
             System.out.println(ex); //handle file not found by displaying message
 
             return ""; //return the empty string if file not fount
 
         }
 
     }
 
 
 
     /** 
 
      * For each word we will consider it as lowercase
 
      * and delete any non letter character.
 
      */
 
     private static String parseString(String s) {
 
         return s.toLowerCase().replaceAll("\\W", "");
 
     }
 
     
 
     /** 
 
      * Print the sentence which has index i
 
      */
 
     private String getSentenceString(int i) {
 
         Sentence sentence = sentenceList.get(i);
 
         return fileContentString.substring(sentence.start, sentence.end);
 
     }
 
 
 
     /**
 
      * After running rank algorithm, sort the result and output the sentences based
 
      * on their score
 
      */
 
     class CollatorComparator implements Comparator<Double> {  
 
         public int compare(Double element1, Double element2) {
 
             double key1 = element1.doubleValue();
 
             double key2 = element2.doubleValue();
 
             if (key1 == key2)
 
                 return 1;
 
             if (key1 > key2)
 
                 return -1;
 
             else
 
                 return 1;
 
         }  
 
     }  
 
 
 
     private void sortAndWriteFile(double[] P) {
 
         try {
 
             CollatorComparator comparator = new CollatorComparator();
 
             Map<Double,Integer> map = new TreeMap<Double, Integer>(comparator);
 
 
 
             for (int i = 0; i < P.length; i++) 
 
                 map.put(P[i], i);
 
 
 
             Set entries = map.entrySet();//得到关键字/值对的集合
 
             Iterator iter = entries.iterator();
 
             PrintWriter writer = new PrintWriter(new BufferedWriter(new FileWriter(outputFileName))); 
 
             DecimalFormat df = new DecimalFormat("#0.00000");
 
             while(iter.hasNext()) {
 
                 Map.Entry entry = (Map.Entry)iter.next();
 
                 double keyWeight = (Double)entry.getKey();
 
                 int valueIndex = (Integer)entry.getValue();
 
                 writer.write("(");
 
                 writer.write(df.format(keyWeight));
 
                 writer.write(") ");
 
                 writer.write(getSentenceString(valueIndex) + "\n");
 
             }
 
             writer.close();
 
         } catch (IOException ex) {
 
             System.out.println(ex); //handle file not found by displaying message
 
         }
 
     }
 
 
 } // end of class Sumarizer