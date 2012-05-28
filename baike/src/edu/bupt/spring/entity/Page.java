package edu.bupt.spring.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "baike_page")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Page {

	private int id;
	private String title;
	private int baibeId;
	private Set<Content> contents = new HashSet<Content>();
	private Set<Reinforce> reinforces = new HashSet<Reinforce>();
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBaibeId() {
		return baibeId;
	}

	public void setBaibeId(int baibeId) {
		this.baibeId = baibeId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@OneToMany(cascade=CascadeType.REFRESH,fetch=FetchType.LAZY,mappedBy="page")
	public Set<Content> getContents() {
		return contents;
	}

	public void setContents(Set<Content> contents) {
		this.contents = contents;
	}


	@OneToMany(cascade = CascadeType.REFRESH, mappedBy = "page", fetch = FetchType.LAZY)
	public Set<Reinforce> getReinforces() {
		return reinforces;
	}

	public void setReinforces(Set<Reinforce> reinforces) {
		this.reinforces = reinforces;
	}

}
