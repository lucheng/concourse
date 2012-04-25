package com.xiaoruoen.common;

import java.util.List;
import java.util.Map;
import java.util.Set;
/**
 * 公工数据类
 * @author xiaoruoen
 *
 */
public class CommonData {
	public static List urlCollection;//存放搜集到的url
	public static List urlInfo;//包含有我们所需信息的url
	public static List urlVisited;//包含已经访问过的url
	public static List urlInfoed;//包含已经搜集过信息的url
	public static Map contents;//搜集到的内容
	public static int linkcount = 0;//已经搜集到的链接的数量
	public static final Integer linkMAX = 1000;//要搜集的链接的最大量
	public static String itemrecord="E:\\iteye\\contents";//用来存放搜集到的内容
	public static String directoryrecord="E:\\iteye\\directoryrecord.txt";//用来存放已经访问过的目录
	public static String filerecord="E:\\iteye\\filerecord.txt";//用过存放已经访问过的文件
	public static String index = "E:\\iteye\\index";//索引创建的地方
	public static String isfirst = "E:\\iteye\\isfirst.txt";//用来记录是否是第一次启动
	public static long indexcount=0;//记录已经创建了多少个索引
}
