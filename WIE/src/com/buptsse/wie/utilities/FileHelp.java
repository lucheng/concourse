package com.buptsse.wie.utilities;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.dom4j.DocumentException;
import org.dom4j.Element;

/**
 * 文件操作类
 * 包括对文件的各种操作
 */
public class FileHelp {

	private static XmlHelp xmlHelp = new XmlHelp();
	
	//设置临时文件夹位置
	public static String TEMPDIR = System.getProperty("java.io.tmpdir") + "buptsseTemp/";
	
	/**
	 * 取得一个文件夹下所有的文件
	 * 
	 * @param directory	文件夹路径
	 * @return			包含文件夹下所有文件名的字符串数组
	 */
	public static String[] getFiles(String directory) {
		File file = new File(directory);
		String[] files = file.list(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				File file = new File(dir, name);
				if(name.endsWith(".html")){
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

	/**
	 * 根据后缀取得一个文件夹下的所有文件名
	 * 
	 * @param directory		文件夹路径
	 * @param suffix		后缀名字
	 * @return				包含文件夹下所有文件名的字符串数组
	 */
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

	/**
	 * 复制文件夹到指定路径
	 * 
	 * @param srcDirStr 源目录
	 * @param dstDirStr	目标目录
	 */
	public static void copyDirectory(String srcDirStr, String dstDirStr) {
		File srcDir = new File(srcDirStr);
		File dstDir = new File(dstDirStr);
		if (srcDir.canRead()) {
			copyDirectory(srcDir, dstDir);
		} else {
			System.out.println("Can't copy directory!");
		}
	}

	/**
	 * 复制文件夹到指定路径
	 * 
	 * @param srcDir	源目录
	 * @param dstDir	目标目录
	 */
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

	/**
	 * 复制文件到指定路径
	 * 
	 * @param src	源文件
	 * @param dst	目标文件
	 */
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

	/**
	 * 根据传入的文件名数组，按照节点数的多少进行排序
	 * 
	 * @param files		文件名数组
	 * @return			排序好的文件名数组
	 * @throws IOException	IO异常
	 * @throws DocumentException
	 */
	public static String[] sortFiles(String[] files) throws IOException, DocumentException {
		int a[] = new int[files.length];
		Element root;
		for (int i = 0; i < files.length; i++) {
			root = xmlHelp.getHtmlDocument(files[i]).getRootElement();
			a[i] = xmlHelp.getTextNodeCount(root);
		}

		String tempFile;
		int tempCount;

		//按照节点数的多少进行排序
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

	/**
	 * 根据文件类型，删除文件夹里的文件
	 * 
	 * @param directory		文件夹路径
	 * @param fileType		文件类型
	 */
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

	/**
	 * 删除文件夹里的文件
	 * @param foder		文件夹路径
	 */
	/*private static void deleteFoder(File foder) {
		for (File file : foder.listFiles()) {
			if (file.isFile()) {
				file.delete();
			} else {
				deleteFoder(file);
			}
		}
	}*/

	/**
	 * 创建新的文件夹
	 * 
	 * @param path 文件夹路径
	 */
	public static void makedir(String path) {
		File foder = new File(path);
		if (!foder.exists()){
			foder.mkdir();
		}
	}

	/**
	 * 将字符内容写入到文件中
	 * 
	 * @param path 文件路径
	 * @param content 文件内容
	 */
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

	/**
	 * 将字符串内容写入到文件中
	 * @param path 文件路径
	 * @param fileName 文件名
	 * @param content 字符串内容
	 */
	public static void writeFile(String path, String fileName, String content) {
		File foder = new File(path);
		if (!foder.exists())
			foder.mkdir();
		writeFile(path + "/" + fileName, content);
	}

	/**
	 * 从jar包中将文件复制到目标目录中
	 * 
	 * @param source	源文件名
	 * @param dest		目标文件名
	 */
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

	/**
	 * 
	 * 取得文件名数组中文件的文件名
	 * 
	 * @param files	文件路径数组
	 * @return		文件名数组
	 */
	public static String[] getNames(String[] files) {
		String[] names = new String[files.length];

		for (int i = 0; i < files.length; i++) {
			File aFile = new File(files[i]);
			names[i] = aFile.getName();
		}

		return names;
	}

	/*public static List<String> getURLs(String filePath) {
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
	}*/

	/*public static String getDir(String filePath) {
		File file = new File(filePath);		
		if (file.exists()) {
			return file.getParentFile().getPath();
		}				
		return "c:/";
	}*/
}
