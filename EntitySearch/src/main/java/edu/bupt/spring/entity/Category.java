package edu.bupt.spring.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

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
@Table(name = "share_category")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Category extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private String name;
//	private Set<FeatureValue> featureValues = new HashSet<FeatureValue>();
//	private Set<Brand> brands = new HashSet<Brand>();
    private int orderList;
    
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
