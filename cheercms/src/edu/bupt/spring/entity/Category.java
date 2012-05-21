package edu.bupt.spring.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import edu.bupt.spring.web.validator.DateFormat;

/**
 * 商品分类
 * @author  linzhe
 * @Date    2012-5-19
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Entity
@Table(name = "tbl_feature")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Category {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private int id;
    private String name;
//	private Set<FeatureValue> featureValues = new HashSet<FeatureValue>();
//	private Set<Brand> brands = new HashSet<Brand>();
    private int orderList;
    
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

	public int getOrderList() {
		return orderList;
	}

	public void setOrderList(int orderList) {
		this.orderList = orderList;
	}
}
