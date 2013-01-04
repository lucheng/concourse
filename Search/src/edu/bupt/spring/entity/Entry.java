package edu.bupt.spring.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 百度词条
 * 
 * @author  linzhe
 * @Date    2012-9-11
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_Entry")
public class Entry extends BaseEntity {

	private static final long serialVersionUID = 1475773294701585482L;

	private String title;// 标题
	private String pos; //词性
	private String summary;// 摘要
	private String property; //属性
	private String url;// 链接
//	private Set<Alias> alias = new HashSet<Alias>();// 别名
	
	@Column(nullable = false,unique=true)
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
	}
	
	@Column(nullable = false)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	/*@OneToMany(mappedBy = "entry",fetch=FetchType.EAGER,cascade=CascadeType.REFRESH)
	public Set<Alias> getAlias() {
		return alias;
	}

	public void setAlias(Set<Alias> alias) {
		this.alias = alias;
	}*/

}