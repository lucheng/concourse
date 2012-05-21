/*
 * ��Ȩ����: Ħ����Ϣ�Ƽ����޹�˾ 2005
 * ��Ŀ��DLOG4J_V3
 * ���ڰ���com.liusoft.dlog4j
 * �ļ�����HtmlNodeFilters.java
 * ����ʱ�䣺2005-12-21
 * �����ߣ�Winter Lau
 */
package com.liusoft.dlog4j;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.tags.TableTag;
import org.htmlparser.tags.TitleTag;

/**
 * ���õ�HTML��ǩ����
 * @author Winter Lau
 */
public class HtmlNodeFilters {

	/**
	 * ������ȡҳ���ͼ��
	 * @author Winter Lau
	 */
	public final static NodeFilter imageFilter = new NodeFilter() {
		public boolean accept(Node node) {
			return (node instanceof ImageTag);
		}		
	};
	/**
	 * ������ȡҳ��ı��
	 * @author Winter Lau
	 */
	public final static NodeFilter tableFilter = new NodeFilter() {
		public boolean accept(Node node) {
			return (node instanceof TableTag);
		}		
	};
	/**
	 * ������ȡҳ��ı���
	 * @author Winter Lau
	 */
	public final static NodeFilter titleFilter = new NodeFilter() {
		public boolean accept(Node node) {
			return (node instanceof TitleTag);
		}		
	};
}
