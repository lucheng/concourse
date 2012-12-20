package com.buptsse.wie;

import java.io.*;
import java.util.*;

import javax.xml.stream.*;
import javax.xml.stream.events.*;
import javax.xml.namespace.QName;

import com.sun.xml.internal.txw2.output.IndentingXMLStreamWriter;

/**
 * 抽取内容集合类
 * 
 * 用于后续的内容显示，抽取结果包含有：文件名、抽取标签集合、抽取内容集合这信息，
 * 在抽取内容集合类中会将这些信息进行处理，比如写入文件编码的处理、对所抽取出的内容进行一一对应、
 * 用户标注名称与所抽取出的内容进行处理，以及一些内容集合的归并显示等操作
 * 
 */

public class ExtractionResultCollection {
	
	// 默认的字符编码
	public static String defaultCharset = "utf-8";
	// 抽取结果的map集合
	private Map<String, ExtractionResult> results;
	// 抽取结果的标签名
	private HashSet<String> headers;

	/**
	 * 构造方法，初始化类变量
	 */
	public ExtractionResultCollection() {
		results = new HashMap<String, ExtractionResult>();
		headers = new HashSet<String>();
	}
	
	public Collection<ExtractionResult> results() {
		return results.values();
	}
	
	public Collection<String> headers() {
		return headers;
	}
	
	
	/**
	 * 判断结果集中是否已包含输入的文件名
	 * 
	 * @param fileName 输入的文件名
	 * @return 是否已包含
	 */
	public boolean containsFile(String fileName) {
		return results.containsKey(fileName);
	}
	
	/**
	 * 将抽取结果添加到抽取结果集中
	 * 
	 * @param result 一个文件抽取出来的内容
	 */
	public void addResult(ExtractionResult result) {
		
		// 判断是否为空
		if (result != null) {
			// 如果没有包含文件名，则将文件名做有key，内容做为value放入map中
			if (!results.containsKey(result.getFileName())) {
				results.put(result.getFileName(), result);
			} else {
				// 如果已经包含，则将内容归并到原有内容里
				results.get(result.getFileName()).merge(result);
			}
			
			mergeHeaders(result.getHeaders());
		}
	}
	
	/**
	 * 将标签名与已有的标签名集合进行合并
	 * 
	 * @param headers 标签名集合
	 */
	private void mergeHeaders(HashSet<String> headers) {
		for (String header : headers) {
			this.headers.add(header);
		}
	}
	
	/**
	 * 清除结果集
	 */
	public void clear() {
		results.clear();
	}
	
	/**
	 * 将内容以默认的编码保存到xml文件中
	 * 
	 * @param fileName 要保存的文件名
	 * @throws Exception 抛出异常
	 */
	public void saveXml(String fileName) throws Exception {
		saveXml(fileName, defaultCharset);
	}
	
	/**
	 * 将抽取出来的网页数据写入到XML文件中
	 * @param fileName 要保存到的文件名
	 * @param charset 文件字符编码
	 * @throws Exception 异常
	 */
	public void saveXml(String fileName, String charset) throws Exception {
		XMLOutputFactory xof = XMLOutputFactory.newInstance();
		IndentingXMLStreamWriter writer = null;
		writer = new IndentingXMLStreamWriter(
				xof.createXMLStreamWriter(
						new FileOutputStream(fileName), charset));
		
		// 对输入流进行配置
		writer.setIndentStep("  ");
		writer.writeStartDocument(charset, "1.0");
		writer.writeStartElement("ExtractionResults");
		
		// 如果headers集合的大小大于0，将集合内容写入
		if (headers.size() > 0) {
			writer.writeStartElement("Headers");
			
			for (String header : headers) {
				writer.writeStartElement("Header");
				writer.writeCharacters(header);
				writer.writeEndElement();
			}
			
			writer.writeEndElement();
		}
		
		// 如果抽取内容集合的大小大于0，将集合内容写入
		if (results.size() > 0) {
			writer.writeStartElement("Results");
			
			// 循环写入抽取的内容
			for (ExtractionResult result : this.results()) {
				
				writer.writeStartElement("Result");
				writer.writeStartElement("FileName");
				writer.writeCharacters(result.getFileName());
				writer.writeEndElement();
				
				// 写入标签名和标签内容
				if (result.tags().size() > 0) {
					
					writer.writeStartElement("Values");
					
					for (ExtractionTag tag : result.tags()) {
						writer.writeStartElement("SemanticTag");
						writer.writeAttribute("name", tag.getName());
						
						for (ExtractionContent content : tag.contents()) {
							writer.writeStartElement("Content");
							if (content.getLink() != null) {
								writer.writeAttribute("href", content.getLink());
							}
							
							writer.writeCharacters(content.getValue());
							writer.writeEndElement();
						}
						
						writer.writeEndElement();
					}
					
					writer.writeEndElement();
				}
				
				writer.writeEndElement();
			}
			
			writer.writeEndElement();
		}
		
		// 输出流写入节点结尾
		writer.writeEndElement();
		writer.writeEndDocument();
		
		// 关闭输出流
		writer.flush();
		writer.close();
	}
	
	/**
	 * 根据传入的文件地址，载入xml文件
	 * 
	 * @param fileName 载入的文件名
	 * @throws Exception 异常
	 */
	public void loadXml(String fileName) throws Exception {
		
		XMLInputFactory xif = XMLInputFactory.newInstance();
		XMLEventReader reader = xif.createXMLEventReader(new FileInputStream(fileName));
		
		ExtractionResult result = null;
		ExtractionTag tag = null;
		ExtractionContent content = null;
		String text = null;
		
		boolean textBegin = false;;
		
		while (reader.hasNext()) {
			XMLEvent event = reader.nextEvent();
			if (event.isStartElement()) {
				StartElement element = (StartElement)event;
				String lName = element.getName().getLocalPart();
				
				if (lName.equals("SemanticTag")) {
					String name = element.getAttributeByName(
							new QName("name")).getValue();
					tag = new ExtractionTag(name);
				} else if (lName.equals("Content")) {
					String href = null;
					Attribute attr = element.getAttributeByName(
							new QName("href"));
					if (attr != null) {
						href = attr.getValue();
					}
					
					content = new ExtractionContent("", href);
					textBegin = true;
					text = "";
				} else if (lName.equals("FileName")) {
					textBegin = true;
					text = "";
				} else if (lName.equals("Header")) {
					textBegin = true;
					text = "";
				}
				
			} else if (event.isEndElement()) {
				EndElement element = (EndElement)event;
				String lName = element.getName().getLocalPart();
				
				if (lName.equals("Result")) {
					if (result != null) {
						addResult(result);
						result = null;
					}
				} else if (lName.equals("Content")) {
					if (content != null) {
						content.setValue(text);
						tag.addContent(content);
						content = null;
						textBegin = false;
					}
				} else if (lName.equals("SemanticTag")) {
					if (tag != null) {
						result.addTag(tag);
						tag = null;
					}
				} else if (lName.equals("FileName")) {
					result = new ExtractionResult(text);
					textBegin = false;
				} else if (lName.equals("Header")) {
					headers.add(text);
					textBegin = false;
				}
			} else if (event.isCharacters()) {
				Characters chars = (Characters)event;
				if (!chars.isWhiteSpace()) {
					String data = chars.getData();
					if (textBegin) {
						text += data;
					} else {
						text = data;
					}
				}
				
			} else if (event.isEntityReference()) {
				EntityReference ref = (EntityReference)event;
				
				System.out.println(ref.toString());
				System.out.println(ref.getName());
				System.out.println(ref.getDeclaration().getName());
				System.out.println(ref.getDeclaration().getNotationName());
			}
		}
		
		reader.close();
	}
}
