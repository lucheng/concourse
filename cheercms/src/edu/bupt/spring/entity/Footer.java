package edu.bupt.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 实体类 - 页面底部信息
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_Footer")
public class Footer extends BaseEntity {

	private static final long serialVersionUID = 8309391131807288450L;

	public static final String FOOTER_ID = "1";// 记录ID

	private String content;// 内容

	@Column(length = 10000)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
