package com.buptsse.filter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.eclipse.swt.widgets.Text;

import com.mywie.utils.XmlHelp;

public class HtmlClear2 {
	public static String charset = "gbk";
	@SuppressWarnings("unchecked")
	public static void clear(String fileName) {
		Document doc=XmlHelp.getDocumentWithClean(fileName);
		Node article=doc.selectSingleNode("//div[@id='m_0']");
		for (Node node:(List<Node>)doc.selectNodes("//div[@class='item-content']"))
		{	
			String str=node.getStringValue();
			if (node.getNodeType()==Node.ELEMENT_NODE) {
				Element element=(Element)node;
				element.clearContent();
				element.setText(str);
			}
		}
		
		try {
			FileOutputStream out = new FileOutputStream(new File(fileName+".html"));
			out.write(("<html><body>").getBytes(charset));
			out.write(article.asXML().getBytes(charset));
			out.write(("</body></html>").getBytes(charset));
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	/**
	 * 
	 * 
163
id="1"
class="bct hd fc05 fc11 nbw-blog"

sohu
id="m_0"
class="item-content"

xinhua
id="main_con"
class="content"


sina
id="module_10001"
class="content"
	 */
	
	public static void main(String[] args) {
		String fileName = "C:/Documents and Settings/linzhe/×ÀÃæ/raw/blog_sohu/";
//		String fileName = "";
		for(int i = 0; i < 28; i++){
//			cleanFile(fileName + i + ".html");
//			intercept(fileName + i + ".html");
			HtmlClear2.clear(fileName + "1 ("+i+").html");
			
		}
	}

}
