package edu.bupt.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 实体类 - 会员注册协议
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_Agreement")
public class Agreement extends BaseEntity {

	private static final long serialVersionUID = 7226979256801891226L;

	public static final String AGREEMENT_ID = "1";// 记录ID

	private String content;// 内容

	@Column(length = 10000)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}