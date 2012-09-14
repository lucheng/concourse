package edu.bupt.spring.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 文章
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_Article")
public class Article extends BaseEntity{

	private static final long serialVersionUID = 1475773294701585482L;

	private String newsno;// 标题
	private String newsTitle;// 标题
	private String newsContent;// 内容
	private String newsUrl;// 页面关键词
	private String category;// 页面描述
	
	private Set<Relation> relations = new HashSet<Relation>();
	
	@Column(unique = true)
	public String getNewsno() {
		return newsno;
	}
	public void setNewsno(String newsno) {
		this.newsno = newsno;
	}
	
	@Column(nullable = false)
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	
	@Lob
	@Basic(fetch=FetchType.LAZY)
	@Column(nullable = false)
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	
	@Column(nullable = false)
	public String getNewsUrl() {
		return newsUrl;
	}
	public void setNewsUrl(String newsUrl) {
		this.newsUrl = newsUrl;
	}
	
	@Column(nullable = false)
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@OneToMany(mappedBy = "article", fetch = FetchType.LAZY,cascade={CascadeType.MERGE,CascadeType.PERSIST})
	public Set<Relation> getRelations() {
		return relations;
	}
	public void setRelations(Set<Relation> relations) {
		this.relations = relations;
	}
}