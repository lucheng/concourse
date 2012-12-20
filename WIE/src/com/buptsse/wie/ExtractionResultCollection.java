package com.buptsse.wie;

import java.io.*;
import java.util.*;

import javax.xml.stream.*;
import javax.xml.stream.events.*;
import javax.xml.namespace.QName;

import com.sun.xml.internal.txw2.output.IndentingXMLStreamWriter;

/**
 * ��ȡ���ݼ�����
 * 
 * ���ں�����������ʾ����ȡ��������У��ļ�������ȡ��ǩ���ϡ���ȡ���ݼ�������Ϣ��
 * �ڳ�ȡ���ݼ������лὫ��Щ��Ϣ���д�������д���ļ�����Ĵ���������ȡ�������ݽ���һһ��Ӧ��
 * �û���ע����������ȡ�������ݽ��д����Լ�һЩ���ݼ��ϵĹ鲢��ʾ�Ȳ���
 * 
 */

public class ExtractionResultCollection {
	
	// Ĭ�ϵ��ַ�����
	public static String defaultCharset = "utf-8";
	// ��ȡ�����map����
	private Map<String, ExtractionResult> results;
	// ��ȡ����ı�ǩ��
	private HashSet<String> headers;

	/**
	 * ���췽������ʼ�������
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
	 * �жϽ�������Ƿ��Ѱ���������ļ���
	 * 
	 * @param fileName ������ļ���
	 * @return �Ƿ��Ѱ���
	 */
	public boolean containsFile(String fileName) {
		return results.containsKey(fileName);
	}
	
	/**
	 * ����ȡ�����ӵ���ȡ�������
	 * 
	 * @param result һ���ļ���ȡ����������
	 */
	public void addResult(ExtractionResult result) {
		
		// �ж��Ƿ�Ϊ��
		if (result != null) {
			// ���û�а����ļ��������ļ�������key��������Ϊvalue����map��
			if (!results.containsKey(result.getFileName())) {
				results.put(result.getFileName(), result);
			} else {
				// ����Ѿ������������ݹ鲢��ԭ��������
				results.get(result.getFileName()).merge(result);
			}
			
			mergeHeaders(result.getHeaders());
		}
	}
	
	/**
	 * ����ǩ�������еı�ǩ�����Ͻ��кϲ�
	 * 
	 * @param headers ��ǩ������
	 */
	private void mergeHeaders(HashSet<String> headers) {
		for (String header : headers) {
			this.headers.add(header);
		}
	}
	
	/**
	 * ��������
	 */
	public void clear() {
		results.clear();
	}
	
	/**
	 * ��������Ĭ�ϵı��뱣�浽xml�ļ���
	 * 
	 * @param fileName Ҫ������ļ���
	 * @throws Exception �׳��쳣
	 */
	public void saveXml(String fileName) throws Exception {
		saveXml(fileName, defaultCharset);
	}
	
	/**
	 * ����ȡ��������ҳ����д�뵽XML�ļ���
	 * @param fileName Ҫ���浽���ļ���
	 * @param charset �ļ��ַ�����
	 * @throws Exception �쳣
	 */
	public void saveXml(String fileName, String charset) throws Exception {
		XMLOutputFactory xof = XMLOutputFactory.newInstance();
		IndentingXMLStreamWriter writer = null;
		writer = new IndentingXMLStreamWriter(
				xof.createXMLStreamWriter(
						new FileOutputStream(fileName), charset));
		
		// ����������������
		writer.setIndentStep("  ");
		writer.writeStartDocument(charset, "1.0");
		writer.writeStartElement("ExtractionResults");
		
		// ���headers���ϵĴ�С����0������������д��
		if (headers.size() > 0) {
			writer.writeStartElement("Headers");
			
			for (String header : headers) {
				writer.writeStartElement("Header");
				writer.writeCharacters(header);
				writer.writeEndElement();
			}
			
			writer.writeEndElement();
		}
		
		// �����ȡ���ݼ��ϵĴ�С����0������������д��
		if (results.size() > 0) {
			writer.writeStartElement("Results");
			
			// ѭ��д���ȡ������
			for (ExtractionResult result : this.results()) {
				
				writer.writeStartElement("Result");
				writer.writeStartElement("FileName");
				writer.writeCharacters(result.getFileName());
				writer.writeEndElement();
				
				// д���ǩ���ͱ�ǩ����
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
		
		// �����д��ڵ��β
		writer.writeEndElement();
		writer.writeEndDocument();
		
		// �ر������
		writer.flush();
		writer.close();
	}
	
	/**
	 * ���ݴ�����ļ���ַ������xml�ļ�
	 * 
	 * @param fileName ������ļ���
	 * @throws Exception �쳣
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
