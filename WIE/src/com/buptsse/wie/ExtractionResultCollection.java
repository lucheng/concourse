package com.buptsse.wie;

import java.io.*;
import java.util.*;

import javax.xml.stream.*;
import javax.xml.stream.events.*;
import javax.xml.namespace.QName;

import com.sun.xml.internal.txw2.output.IndentingXMLStreamWriter;

/**
 * 抽取内容集合类
 * 用于后续的内容显示
 * 
 */

public class ExtractionResultCollection {
	public static String defaultCharset = "utf-8";
	
	private Map<String, ExtractionResult> results;
	private HashSet<String> headers;

	public ExtractionResultCollection() {
		// TODO Auto-generated constructor stub
		results = new HashMap<String, ExtractionResult>();
		headers = new HashSet<String>();
	}
	
	public Collection<ExtractionResult> results() {
		return results.values();
	}
	
	public Collection<String> headers() {
		return headers;
	}
	
	public boolean containsFile(String fileName) {
		return results.containsKey(fileName);
	}
	
	public void addResult(ExtractionResult result) {
		if (result != null) {
			if (!results.containsKey(result.getFileName())) {
				results.put(result.getFileName(), result);
			} else {
				results.get(result.getFileName()).merge(result);
			}
			
			mergeHeaders(result.getHeaders());
		}
	}
	
	private void mergeHeaders(HashSet<String> headers) {
		for (String header : headers) {
			this.headers.add(header);
		}
	}
	
	public void clear() {
		results.clear();
	}
	
	public void saveXml(String fileName) throws Exception {
		saveXml(fileName, defaultCharset);
	}
	
	public void saveXml(String fileName, String charset) throws Exception {
		XMLOutputFactory xof = XMLOutputFactory.newInstance();
		IndentingXMLStreamWriter writer = null;
		writer = new IndentingXMLStreamWriter(
				xof.createXMLStreamWriter(
						new FileOutputStream(fileName), charset));
		writer.setIndentStep("  ");
		
		writer.writeStartDocument(charset, "1.0");
		writer.writeStartElement("ExtractionResults");
		
		if (headers.size() > 0) {
			writer.writeStartElement("Headers");
			
			for (String header : headers) {
				writer.writeStartElement("Header");
				writer.writeCharacters(header);
				writer.writeEndElement();
			}
			
			writer.writeEndElement();
		}
		
		if (results.size() > 0) {
			writer.writeStartElement("Results");
			
			for (ExtractionResult result : this.results()) {
				writer.writeStartElement("Result");
				
				writer.writeStartElement("FileName");
				writer.writeCharacters(result.getFileName());
				writer.writeEndElement();
				
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
		
		writer.writeEndElement();
		writer.writeEndDocument();
		
		writer.flush();
		writer.close();
	}
	
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
