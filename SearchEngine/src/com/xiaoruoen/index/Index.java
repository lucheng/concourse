package com.xiaoruoen.index;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.xiaoruoen.common.CommonData;
import com.xiaoruoen.common.FileOut;
/**
 * 建立索引
 * @author xiaoruoen
 *
 */
public class Index extends TimerTask {
	IndexWriter writer;
	Logger logger = Logger.getLogger(Index.class);

	/**
	 * 用来过滤文件
	 * 
	 * @author Administrator
	 * 
	 */
	public static class TextFilter implements FileFilter {
		public boolean accept(File path) {
			return path.getName().toLowerCase().endsWith(".txt");
		}
	}

	public Index() {
		Analyzer analyzer = new IKAnalyzer();// 中文分词分析
		File isfirstfile = new File(CommonData.isfirst);//是否为第一次启动，如果是第一次启动的话，索引采用添加而不是更新，如果不是话的，索引为合并更新
		BufferedReader filereader;
		// 找到上次读到的文件
		try {
			filereader = new BufferedReader(new InputStreamReader(
					new FileInputStream(isfirstfile)));
			int startcount = Integer.parseInt(filereader.readLine());
			Directory directory = FSDirectory.open(new File(CommonData.index));
			// 由是不是第一次启动来确定是true还是false，来确定索引是添加还是合并更新
			writer = new IndexWriter(directory, analyzer,
					startcount > 0 ? false : true,
					IndexWriter.MaxFieldLength.UNLIMITED);
			BufferedWriter writer = new BufferedWriter(new FileWriter(
					isfirstfile));
			writer.write(startcount + 1 + "");//启动项加1
			writer.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		File recordfile = new File(CommonData.filerecord);//记录下已经访问过的文件
		File directoryfile = new File(CommonData.directoryrecord);//记录下已经访问过的目录
		FileFilter filter = new TextFilter();
		try {
			BufferedReader directoryreader = new BufferedReader(
					new InputStreamReader(new FileInputStream(directoryfile)));// 找到上次读到的目录
			BufferedReader filereader = new BufferedReader(
					new InputStreamReader(new FileInputStream(recordfile)));// 找到上次读到的文件
			String nowdirectory = directoryreader.readLine();//读取目录
			String nowfile = filereader.readLine();//读取文件
			//截取所需信息
			long currentdirectory = Long.parseLong(nowdirectory.substring(0,
					nowdirectory.indexOf(".") > -1 ? nowdirectory.indexOf(".")
							: nowdirectory.length()));
			long currentfile = Long.parseLong(nowfile.substring(0, nowfile
					.indexOf(".") > -1 ? nowfile.indexOf(".") : nowfile
					.length()));
			//列出目录
			File[] directorys = new File(CommonData.itemrecord).listFiles();
			for (File directory : directorys) {
				
				// 如果目录还没有被读取或者没有读取完的话，接着读取
				if (directory.canRead()
						&& directory.isDirectory()
						&& Long
								.parseLong(directory
										.getName()
										.substring(
												0,
												directory.getName()
														.indexOf(".") == -1 ? directory
														.getName().length()
														: directory.getName()
																.indexOf("."))) >= currentdirectory) {
					
					File[] files = directory.listFiles();//列出文件
					for (File file : files) {
						
						// 如果文件是以.txt结尾的而且可读并读还未读过的，接着读取
						if (file.exists()
								&& file.isFile()
								&& file.canRead()
								&& !file.isHidden()
								&& !file.isDirectory()
								&& (filter == null || filter.accept(file))
								&& Long
										.parseLong(file
												.getName()
												.substring(
														0,
														file.getName().indexOf(
																".") == -1 ? file
																.getName()
																.length()
																: file
																		.getName()
																		.indexOf(
																				"."))) > currentfile) {
							logger.info("取得目录"+directory.getName()+"下的文件：" + file.getName());
							logger.info("对" + file.getName() + "建立索引");
							List docs;
							try {
								// 提取信息，放入document中
								docs = getDocument(file);
								for (Object o : docs) {
									// 将document放入到indexwriter中
									writer.addDocument((Document) o);
								}
							} catch (IOException e) {
								e.printStackTrace();
							}
							logger.info("共对"+CommonData.indexcount+"个文件创建了索引");
						}
					}
					FileOut.instance().write(directory.getName(),
							CommonData.directoryrecord);// 在文件中记录下已经建立索引的文件夹
					
				}
				writer.commit();//将索引提交
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 解析文档
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 */
	public List getDocument(File file) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				new FileInputStream(file)));
		String line = "";
		String result = "";
		List docs = new ArrayList();
		while ((line = reader.readLine()) != null) {
			result += line;
			if (line.startsWith("data")) {
				String url = result.substring(result.indexOf(":") + 1, result
						.indexOf("data"));
				// 解析文件，提取图片，价格，名称等信息
				String data = result
						.substring((result.indexOf("{") + 1) == 0 ? 0 : (result
								.indexOf("{") + 1),
								result.indexOf("}") == -1 ? (result
										.indexOf("{") + 1) == 0 ? 0 : (result
										.indexOf("{") + 1) : result
										.indexOf("}"));
				if (data != null && !"".equals(data)) {
					String[] infos = data.split(",");
					String pic = "";
					String price = "";
					String title = "";
					for (String info : infos) {
						if (info.contains("pic")) {
							pic = info.substring(info.indexOf(":") + 2, info
									.length() - 1);

						}
						if (info.contains("price")) {
							price = info.substring(info.indexOf(":") + 2, info
									.length() - 1);

						}
						if (info.contains("title")) {
							title = info.substring(info.indexOf(":") + 2, info
									.length() - 1);

						}
					}
					logger.info("pic:" + pic);
					logger.info("price:" + price);
					logger.info("title:" + title);
					Document doc = new Document();// 向lucene中添加document
					doc.add(new Field("url", url, Field.Store.YES,// document都是由field组成的
							Field.Index.NOT_ANALYZED));
					doc.add(new Field("title", title, Field.Store.YES,
							Field.Index.ANALYZED));
					doc.add(new Field("price", price, Field.Store.YES,
							Field.Index.NOT_ANALYZED));
					doc.add(new Field("pic", pic, Field.Store.YES,
							Field.Index.NOT_ANALYZED));
					docs.add(doc);
					CommonData.indexcount++;
					result = "";
				}
			}
		}
		FileOut.instance().write(file.getName(), CommonData.filerecord);
		return docs;
	}
	
}
