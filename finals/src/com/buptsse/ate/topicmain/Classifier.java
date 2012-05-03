package com.buptsse.ate.topicmain;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import ICTCLAS.I3S.AC.ICTCLAS50;

import com.buptsse.ate.utils.Constant;

public class Classifier {

	private String filePath; 
	private String outPath;  
	private Logger log = Logger.getLogger(getClass());
	private int flag; 

	/*
	 */
	public Classifier(String path, String outputsPath, int f) {
		filePath = path;
		outPath = outputsPath;
		flag = f;
		PropertyConfigurator.configure(Constant.LOG4J);
	}

	/**
	 * Automatically tag the files
	 */
	public void classify() {
		
		File path = new File(filePath);

		// the file object which contains the directory of folder
		ArrayList<File> dir = new ArrayList<File>();
		dir.add(path);
		
		ICTCLAS50 testICTCLAS2010 = new ICTCLAS50();

		/**
		 * Change the implementation of word splitting by allowing the
		 * directories to be nested.
		 */
		while (!dir.isEmpty()) {

			path = dir.remove(0);
			String inDirPath = path.getAbsolutePath();
			String newInDirPath = inDirPath.replace("","");
			String outDirPath = inDirPath.substring(filePath.length());
			String newOutDirPath = outDirPath.replace("","");
			File tempF = new File(newInDirPath);
			path.renameTo(tempF);

			// Make an directory in the tag files' directory
			File outDir = null;
			
			if (flag == 1) { 
				outDir = new File(Constant.CPATH + newOutDirPath);
				// Make an directory in the res files' directory
				File resDir = new File(outPath + newOutDirPath);
				if (!resDir.exists()) {
					resDir.mkdir();
				}
			}
			
			if (flag == 2) { // 
				outDir = new File(Constant.CTPATH + newOutDirPath);
			}

			// Organize the files tree structures as original
			if (!outDir.exists()) {
				outDir.mkdir();
			}
			
			if (tempF.isFile()) {
				try {
					// form tag file
					String temp1 = tempF.getAbsolutePath();
					String temp2 = "";
					if (flag == 1) { 
						temp2 = Constant.CPATH + "/" + rename(tempF.getName());
					}
					if (flag == 2) { 
						temp2 = Constant.CTPATH + "/" + rename(tempF.getName());
					}
				
					testICTCLAS2010.ICTCLAS_FileProcess(temp1.getBytes("GB2312"), temp2.getBytes("GB2312"), 1);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
					log.info(e.getMessage());
				}
			} else {
//				log.info(tempF);
				File[] files = tempF.listFiles();
				
				for (int i = 0; i < files.length; i++) {
					if (files[i].isDirectory()) {
						dir.add(files[i]);
					} else { 
						String argu1 = files[i].getAbsolutePath();
						String newName = argu1.replace("",""); 
						File f = new File(newName);
						files[i].renameTo(f);
						String temp1 = f.getAbsolutePath();
						// the path of tag file
						String argu2 = "";
						if (flag == 1) {
							argu2 = Constant.CPATH + "/"
									+ rename(files[i].getName());
						}
						if (flag == 2) {
							argu2 = Constant.CTPATH + "/"
									+ rename(files[i].getName());
						}

						String temp2 = argu2.replace("", "");
						try {
							// form tag file
							testICTCLAS2010.ICTCLAS_FileProcess(temp1.getBytes("GB2312"), temp2.getBytes("GB2312"), 1);
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
							log.info(e.getMessage());
						}
					}
				}
			}
		}

		testICTCLAS2010.ICTCLAS_Exit();
	}

	/**
	 * change the suffix of the file be tagged from ".txt" to ".seg"
	 * 
	 * @param name the name of the file be tagged
	 * @return the changed name
	 */
	private String rename(String name) {
		return name.substring(0,name.lastIndexOf(".")) + ".seg";
	}

}
