package edu.bupt.spring.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
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
	private String alias;// 别名
	private String pos; //词性
	private String summary;// 摘要
	private String property; //属性
	private String url;// 链接
	
	private Set<Relation> relations = new HashSet<Relation>();
	
	
	@Column(nullable = false,unique=true)
	public String getTitle() {
		return title;
	}
	
	@OneToMany(mappedBy = "entry",fetch=FetchType.LAZY,cascade={CascadeType.ALL})
	public Set<Relation> getRelations() {
		return relations;
	}
	public void setRelations(Set<Relation> relations) {
		this.relations = relations;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
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
	
	public List<Map<String, String>> fetchAliasMap(){
		List<Map<String, String>> aliasMap = new ArrayList<Map<String, String>>();
		
		return aliasMap;
	}
	
	public String processAliasMap(List<Map<String, String>> aliasMap){
		
		return "";
	}

}