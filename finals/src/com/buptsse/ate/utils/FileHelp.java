package com.buptsse.ate.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.DocumentException;
import org.dom4j.Element;

public class FileHelp {

	private static XmlHelp xmlHelp = new XmlHelp();
	public static String TEMPDIR = System.getProperty("java.io.tmpdir") + "buptsseTemp/";
	
	public static String[] getFiles(String directory) {
		File file = new File(directory);
		String[] files = file.list(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				File file = new File(dir, name);
				if(name != null){
					return file.isFile();
				}else {
					return false;
				}
			}
		});

		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				files[i] = directory + "/" + files[i];
			}
		}
		return files;
	}

	public static String[] getFiles(String directory, final String suffix) {
		File file = new File(directory);
		String[] files = file.list(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				if (name.endsWith(suffix)) {
					return true;
				} else {
					return false;
				}
			}
		});

		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				files[i] = directory + "/" + files[i];
			}
		}
		return files;
	}

	public static void copyDirectory(String srcDirStr, String dstDirStr) {
		File srcDir = new File(srcDirStr);
		File dstDir = new File(dstDirStr);
		if (srcDir.canRead()) {
			copyDirectory(srcDir, dstDir);
		} else {
			System.out.println("Can't copy directory!");
		}
	}

	public static void copyDirectory(File srcDir, File dstDir) {
		if (srcDir.isDirectory()) {
			if (!dstDir.exists()) {
				dstDir.mkdir();
			}
			String[] children = srcDir.list();
			for (int i = 0; i < children.length; i++) {
				copyDirectory(new File(srcDir, children[i]), new File(dstDir,
						children[i]));
			}
		} else {
			copyFile(srcDir, dstDir);
		}
	}

	public static void copyFile(File src, File dst) {
		InputStream in;
		try {
			in = new FileInputStream(src);
			OutputStream out = new FileOutputStream(dst);
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0) {

				out.write(buf, 0, len);

			}
			in.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String[] sortFiles(String[] files) throws IOException, DocumentException {
		int a[] = new int[files.length];
		Element root;
		for (int i = 0; i < files.length; i++) {
			root = xmlHelp.getDocumentWithClean(files[i]).getRootElement();
			a[i] = xmlHelp.getTextNodeCount(root);
		}

		String tempFile;
		int tempCount;

		for (int i = 0; i < files.length; i++) {
			for (int j = i + 1; j < files.length; j++) {
				if (a[j] > a[i]) {
					tempCount = a[i];
					a[i] = a[j];
					a[j] = tempCount;
					tempFile = files[i];
					files[i] = files[j];
					files[j] = tempFile;
				}
			}
		}
		return files;
	}

	public static void deleteFiles(String directory, final String fileType) {
		File file = new File(directory);
		File[] files = file.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				if (name.endsWith(fileType)) {
					return true;
				} else {
					return false;
				}
			}
		});
		for (int i = 0; i < files.length; i++) {
			files[i].deleteOnExit();
		}
	}

	private static void deleteFoder(File foder) {
		for (File file : foder.listFiles()) {
			if (file.isFile()) {
				file.delete();
			} else {
				deleteFoder(file);
			}
		}
	}

	public static void makedir(String path) {
		File foder = new File(path);
		if (!foder.exists()){
			foder.mkdir();
		}
	}

	public static void writeFile(String path, String content) {
		FileWriter outputStream;
		try {
			File aFile = new File(path);
			if (!aFile.exists())
				aFile.createNewFile();
			outputStream = new FileWriter(aFile);
			outputStream.write(content);
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void writeFile(String path, String fileName, String content) {
		File foder = new File(path);
		if (!foder.exists())
			foder.mkdir();
		writeFile(path + "/" + fileName, content);
	}
	
	public static String readText(String fileName) {
		
		String content = "";
        try {
        	BufferedReader in = new BufferedReader(new FileReader(fileName)); 
            
            String line = null;
			while((line = in.readLine())!=null) 
			{ 
				content += line + System.getProperty("line.separator"); 
			}
			/*if(filters != null){
				for(int i = 0; i < filters.length; i++) {//String filter : filters){
					content = content.replace(content, filters[i]);
				}
			}*/
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return content;
	}

	public static String getAppPath(Class cls) {
		// ����û�����Ĳ����Ƿ�Ϊ��
		if (cls == null)
			throw new java.lang.IllegalArgumentException("��������Ϊ�գ�");
		ClassLoader loader = cls.getClassLoader();
		// ������ȫ������������
		String clsName = cls.getName() + ".class";
		// ��ô���������ڵİ�
		Package pack = cls.getPackage();
		String path = "";
		// ���������������������ת��Ϊ·��
		if (pack != null) {
			String packName = pack.getName();
			// �˴����ж��Ƿ���Java������⣬��ֹ�û�����JDK���õ����
			if (packName.startsWith("java.") || packName.startsWith("javax."))
				throw new java.lang.IllegalArgumentException("��Ҫ����ϵͳ�࣡");
			// ����������У�ȥ�������Ĳ��֣��������ļ���
			clsName = clsName.substring(packName.length() + 1);
			// �ж������Ƿ��Ǽ򵥰���������ǣ���ֱ�ӽ�����ת��Ϊ·����
			if (packName.indexOf(".") < 0)
				path = packName + "/";
			else {// �����հ�������ɲ��֣�������ת��Ϊ·��
				int start = 0, end = 0;
				end = packName.indexOf(".");
				while (end != -1) {
					path = path + packName.substring(start, end) + "/";
					start = end + 1;
					end = packName.indexOf(".", start);
				}
				path = path + packName.substring(start) + "/";
			}
		}
		// ����ClassLoader��getResource�������������·����Ϣ�����ļ���
		java.net.URL url = loader.getResource(path + clsName);
		// ��URL�����л�ȡ·����Ϣ
		String realPath = url.getPath();
		// ȥ��·����Ϣ�е�Э����"file:"
		int pos = realPath.indexOf("file:");
		if (pos > -1)
			realPath = realPath.substring(pos + 5);
		// ȥ��·����Ϣ���������ļ���Ϣ�Ĳ��֣��õ������ڵ�·��
		pos = realPath.indexOf(path + clsName);
		realPath = realPath.substring(0, pos - 1);
		// ������ļ��������JAR���ļ���ʱ��ȥ����Ӧ��JAR�ȴ���ļ���
		if (realPath.endsWith("!"))
			realPath = realPath.substring(0, realPath.lastIndexOf("/"));
		/*------------------------------------------------------------ 
		 ClassLoader��getResource����ʹ����utf-8��·����Ϣ�����˱��룬��·�� 
		  �д������ĺͿո�ʱ���������Щ�ַ�����ת�����������õ�����������������Ҫ 
		  ����ʵ·�����ڴˣ�������URLDecoder��decode�������н��룬�Ա�õ�ԭʼ�� 
		  ���ļ��ո�·�� 
		-------------------------------------------------------------*/
		try {
			realPath = java.net.URLDecoder.decode(realPath, "utf-8");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return realPath.substring(1);
	}// getAppPath�������

	public static void copyJarFile(String source, String dest) {
		InputStream in = FileHelp.class.getResourceAsStream(source);
		try {
			OutputStream out = new FileOutputStream(dest);
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
			in.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String[] getNames(String[] files) {
		String[] names = new String[files.length];

		for (int i = 0; i < files.length; i++) {
			File aFile = new File(files[i]);
			names[i] = aFile.getName();
		}

		return names;
	}

	public static List<String> getURLs(String filePath) {
		List<String> urls = new ArrayList<String>();
		try {
			FileReader reader = new FileReader(filePath);
			BufferedReader bfReader = new BufferedReader(reader);
			String url = null;
			while ((url = bfReader.readLine()) != null) {
				urls.add(url);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return urls;
	}

	public static String getDir(String filePath) {
		File file = new File(filePath);		
		if (file.exists()) {
			return file.getParentFile().getPath();
		}				
		return "c:/";
	}

	public static void main(String argv[]) {
		
	}

}
