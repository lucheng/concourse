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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 商品
 * @author  linzhe
 * @Date    2012-5-19
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Entity
@Table(name = "share_product")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Product {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String originUrl;
    private String url;
    private double price;
    private int orderList;
    
    private Set<Tag> tags = new HashSet<Tag>();
    private Set<Image> images = new HashSet<Image>();
    private Set<Comment> comments = new HashSet<Comment>();
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="product")
	public Set<Image> getImages() {
		return images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}

	public String getOriginUrl() {
		return originUrl;
	}

	public void setOriginUrl(String originUrl) {
		this.originUrl = originUrl;
	}

	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, mappedBy = "products", fetch = FetchType.LAZY)
	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="product")
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public int getOrderList() {
		return orderList;
	}

	public void setOrderList(int orderList) {
		this.orderList = orderList;
	}
}
