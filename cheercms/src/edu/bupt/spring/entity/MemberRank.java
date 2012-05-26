package edu.bupt.spring.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_member_rank")
public class MemberRank {
	
	private int id;
	private String name;
	private int preferentialScale;
	private int score;
	private int defaulte;
	
	private Set<Member> members = new HashSet<Member>();
	
	@Id
	@GeneratedValue
	@Column(name="id",unique = true)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getPreferentialScale() {
		return preferentialScale;
	}
	public void setPreferentialScale(int preferentialScale) {
		this.preferentialScale = preferentialScale;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	@Column(name="is_default")	
	public int getDefaulte() {
		return defaulte;
	}
	public void setDefaulte(int defaulte) {
		this.defaulte = defaulte;
	}
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="memberRank")
	public Set<Member> getMembers() {
		return members;
	}
	public void setMembers(Set<Member> members) {
		this.members = members;
	}
	
}
