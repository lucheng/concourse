package edu.bupt.spring.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import edu.bupt.spring.utils.SystemConfigUtil;

/**
 * 实体类 - 购物车项
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_CartItem")
public class CartItem extends BaseEntity {

	private static final long serialVersionUID = -4241469437632553865L;
	
	private Integer quantity;// 数量
	
	private Product product;// 商品
	private Member member;// 会员

	@Column(nullable = false)
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	// 获取优惠价格，若member对象为null则返回原价格
	@Transient
	public BigDecimal getPreferentialPrice() {
		if (member != null) {
			BigDecimal preferentialPrice = product.getPrice().multiply(new BigDecimal(member.getMemberRank().getPreferentialScale().toString()).divide(new BigDecimal("100")));
			return SystemConfigUtil.getPriceScaleBigDecimal(preferentialPrice);
		} else {
			return product.getPrice();
		}
	}
	
	// 获取小计价格
	@Transient
	public BigDecimal getSubtotalPrice() {
		BigDecimal subtotalPrice = getPreferentialPrice().multiply(new BigDecimal(quantity.toString()));
		return SystemConfigUtil.getOrderScaleBigDecimal(subtotalPrice);
	}

}