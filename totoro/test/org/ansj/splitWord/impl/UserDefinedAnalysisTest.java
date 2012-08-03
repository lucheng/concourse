package org.ansj.splitWord.impl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashSet;

import org.ansj.domain.Term;
import org.ansj.library.NatureEnum;
import org.ansj.splitWord.analysis.UserDefinedAnalysis;

public class UserDefinedAnalysisTest {
	static HashSet hs = new HashSet() ;
	public static void main(String[] args) throws IOException {
		Reader reader = new InputStreamReader(new FileInputStream("D:/data/text/1139_ceo.txt"), "UTF-8");
		UserDefinedAnalysis toAnalysis = new UserDefinedAnalysis(reader,true);
		Term next = null;
		long start = System.currentTimeMillis();
		StringBuilder sb =  new StringBuilder() ;
		while ((next = toAnalysis.next()) != null) {
//			System.out.println(next.getName() + ":" + next.maxNature);
//			sb.append(next.getName()+":"+next.maxNature+"/ ") ;
//			sb.append("\n") ;
			if(next.maxNature==NatureEnum.nr&&!hs.contains(next.getName())){
			System.out.println(next.getName()+":"+next.getOffe());
			hs.add(next.getName()) ;
			}
		}
		System.out.println(System.currentTimeMillis() - start);
//		IOUtil.Writer("/Users/ansj/Documents/快盘/冒死.txt", "UTF-8", sb.toString()) ;
	}
}