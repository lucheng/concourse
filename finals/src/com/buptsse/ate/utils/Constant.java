package com.buptsse.ate.utils;
/**
 * This class defines some constants used in the entire project.
 * 
 * @author ZhuYan
 */
public class Constant {
	public final static String DELIMITER = "\\s";

	public final static String PREPATH = "input";
	
	public final static String LOG4J = "log4j.properties";
	
	public final static String EPATH = PREPATH + "/etfiles";

	public final static String CPATH = PREPATH + "/ctfiles";     // ���ѵ������tag�ļ�
	
	public final static String CTPATH = PREPATH + "/ctestfiles"; // ��Ų��Լ���tag�ļ�
	
	public final static String RESULT_FILE = PREPATH + "/output/result.txt"; // ���Խ��·��
	
	public final static int TRAIN_FLAG = 1;                    // ѵ������־
	
	public final static int TEST_FLAG = 2;                     // ���Լ���־
	
	public final static String USERDICT = "ICTCLAS_CONFIG/userdict.txt"; // �û��ʵ��·��
	
	public final static String PRECSTOPLIST = PREPATH + "/cate/StopLists/stop-list-prefix.txt";
	
	public final static String POSTCSTOPLIST = PREPATH + "/cate/StopLists/stop-list-postfix.txt";
	
	public final static String SINGLECSTOPLIST = PREPATH + "/cate/StopLists/stop-list.txt";
	
	public final static String MIDDLECSTOPLIST = PREPATH + "/cate/StopLists/stop-list-middle.txt";
	
	public final static String PREESTOPLIST = PREPATH + "/eate/StopLists/stop-list-prefix.txt";
	
	public final static String POSTESTOPLIST = PREPATH + "/eate/StopLists/stop-list-postfix.txt";
	
	public final static String SINGLEESTOPLIST = PREPATH + "/eate/StopLists/stop-list.txt";
	
	public final static String MIDDLEESTOPLIST = PREPATH + "/eate/StopLists/stop-list-middle.txt";
	
	public final static int SINGLETHRESHOLD = 2;     // ���˵�����ķ�ֵ
	
	public final static int DOUBLETHRESHOLD = 1;     // ����˫����ķ�ֵ
	
	public final static int TRIPLETHRESHOLD = 1;     // ����������ķ�ֵ
	
	public final static double MI = 200.0;
	
	public final static double LOGLR = 50.0;
	
	public final static int K = 10;                   // KNN�㷨��ȡ��Kֵ
	
	public final static int KTHRESHOLD = 1;          // ������ķ�ֵ
	
}
