package edu.bupt.corpus.sogou;

public class DocBean {

	private Integer docid;
	private String no;
	private String url;
	private String title;
	private String content;
	private String category;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getDocid() {
		return docid;
	}

	public void setDocid(Integer docid) {
		this.docid = docid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
}