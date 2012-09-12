package edu.bupt.spring.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
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
@Table(name="tbl_Relation")
public class Relation extends BaseEntity {

	private static final long serialVersionUID = 1475773294701585482L;

	private Article article;
	private Entry entry;
	private double relationship;
	
	@OneToOne(optional=false,cascade={CascadeType.ALL})  
    @JoinColumn(name="article_id")
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	
	@OneToOne(optional=false,cascade={CascadeType.ALL})  
    @JoinColumn(name="entry_id")
	public Entry getEntry() {
		return entry;
	}
	public void setEntry(Entry entry) {
		this.entry = entry;
	}
	
	@Column(nullable = false)
	public double getRelationship() {
		return relationship;
	}
	public void setRelationship(double relationship) {
		this.relationship = relationship;
	}
}