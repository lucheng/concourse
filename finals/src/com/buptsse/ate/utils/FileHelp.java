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
		// 检查用户传入的参数是否为空
		if (cls == null)
			throw new java.lang.IllegalArgumentException("参数不能为空！");
		ClassLoader loader = cls.getClassLoader();
		// 获得类的全名，包括包名
		String clsName = cls.getName() + ".class";
		// 获得传入参数所在的包
		Package pack = cls.getPackage();
		String path = "";
		// 如果不是匿名包，将包名转化为路径
		if (pack != null) {
			String packName = pack.getName();
			// 此处简单判定是否是Java基础类库，防止用户传入JDK内置的类库
			if (packName.startsWith("java.") || packName.startsWith("javax."))
				throw new java.lang.IllegalArgumentException("不要传送系统类！");
			// 在类的名称中，去掉包名的部分，获得类的文件名
			clsName = clsName.substring(packName.length() + 1);
			// 判定包名是否是简单包名，如果是，则直接将包名转换为路径，
			if (packName.indexOf(".") < 0)
				path = packName + "/";
			else {// 否则按照包名的组成部分，将包名转换为路径
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
		// 调用ClassLoader的getResource方法，传入包含路径信息的类文件名
		java.net.URL url = loader.getResource(path + clsName);
		// 从URL对象中获取路径信息
		String realPath = url.getPath();
		// 去掉路径信息中的协议名"file:"
		int pos = realPath.indexOf("file:");
		if (pos > -1)
			realPath = realPath.substring(pos + 5);
		// 去掉路径信息最后包含类文件信息的部分，得到类所在的路径
		pos = realPath.indexOf(path + clsName);
		realPath = realPath.substring(0, pos - 1);
		// 如果类文件被打包到JAR等文件中时，去掉对应的JAR等打包文件名
		if (realPath.endsWith("!"))
			realPath = realPath.substring(0, realPath.lastIndexOf("/"));
		/*------------------------------------------------------------ 
		 ClassLoader的getResource方法使用了utf-8对路径信息进行了编码，当路径 
		  中存在中文和空格时，他会对这些字符进行转换，这样，得到的往往不是我们想要 
		  的真实路径，在此，调用了URLDecoder的decode方法进行解码，以便得到原始的 
		  中文及空格路径 
		-------------------------------------------------------------*/
		try {
			realPath = java.net.URLDecoder.decode(realPath, "utf-8");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return realPath.substring(1);
	}// getAppPath定义结束

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
