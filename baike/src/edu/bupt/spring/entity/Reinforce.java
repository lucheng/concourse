package edu.bupt.spring.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "baike_reinforce")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Reinforce {
	
	private int id;
	private int local;
	private int baiduId;
	private String text;
	private Page page;
	
	public Reinforce(int local, int baiduId, String text){
		
		this.local = local;
		this.baiduId = baiduId;
		this.text = text;
	}
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getBaiduId() {
		return baiduId;
	}

	public void setBaiduId(int baiduId) {
		this.baiduId = baiduId;
	}

	public int getLocal() {
		return local;
	}

	public void setLocal(int local) {
		this.local = local;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	@ManyToOne(cascade=CascadeType.REMOVE,fetch=FetchType.EAGER, optional=false)
	@JoinColumn(name="page_id")
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
	
}

