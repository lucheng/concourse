package edu.bupt.spring.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name="tbl_Alias")
public class Alias extends BaseEntity {

	private static final long serialVersionUID = 1475773294701585482L;

	private String title;// 标题
	private String pos; //词性
	
	private Entry entry;
	
	private Set<Relation> relations = new HashSet<Relation>();
	
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
	
	@ManyToOne(optional=false,fetch=FetchType.EAGER,cascade={CascadeType.REMOVE,CascadeType.REFRESH})  
    @JoinColumn(name="entry_id")
	public Entry getEntry() {
		return entry;
	}

	public void setEntry(Entry entry) {
		this.entry = entry;
	}

	@OneToMany(mappedBy = "alias", fetch = FetchType.LAZY,cascade={CascadeType.MERGE,CascadeType.PERSIST})
	public Set<Relation> getRelations() {
		return relations;
	}
	public void setRelations(Set<Relation> relations) {
		this.relations = relations;
	}
	
	@Override
	public String toString() {
		
		return this.title;
	}
}