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
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * 实体类 - 菜单项
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Entity
@Table(name="tbl_Menu")
public class Menu extends BaseEntity {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1967792886654690970L;
	private String name;
	private String url;
	private int orderList;
	private String status;
	/** 子类别 **/
	private Set<Menu> children = new HashSet<Menu>();
	/** 所属父类 **/
	private Menu parent;
	
	@Column(name="name")
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
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="parentid")
	@OrderBy(value="orderList")
	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="parent")
	@OrderBy(value="orderList")
	public Set<Menu> getChildren() {
		return children;
	}

	public void setChildren(Set<Menu> children) {
		this.children = children;
	}
	
	public int getOrderList() {
		return orderList;
	}
	public void setOrderList(int orderList) {
		this.orderList = orderList;
	}
	
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
