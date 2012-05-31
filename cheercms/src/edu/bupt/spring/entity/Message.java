package edu.bupt.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 实体类 - 消息
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_Message")
public class Message extends BaseEntity {

	private static final long serialVersionUID = -112310144651384975L;
	
	public static final int DEFAULT_MESSAGE_LIST_PAGE_SIZE = 12;// 消息列表默认每页显示数

	// 删除状态（未删除、发送者删除、接收者删除）
	public enum DeleteStatus {
		nonDelete, fromDelete, toDelete
	};

	private String title;// 消息标题
	private String content;// 消息内容
	private DeleteStatus deleteStatus;// 删除状态
	private Boolean isRead;// 是否标记已读
	private Boolean isSaveDraftbox;// 是否保存在草稿箱
	
	private Member fromMember;// 消息发出会员,为null时表示管理员
	private Member toMember;// 消息接收会员,为null时表示管理员


	@Column(nullable = false)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(length = 10000, nullable = false)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Enumerated
	@Column(nullable = false)
	public DeleteStatus getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(DeleteStatus deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	@Column(nullable = false)
	public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

	@Column(nullable = false)
	public Boolean getIsSaveDraftbox() {
		return isSaveDraftbox;
	}

	public void setIsSaveDraftbox(Boolean isSaveDraftbox) {
		this.isSaveDraftbox = isSaveDraftbox;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	public Member getFromMember() {
		return fromMember;
	}

	public void setFromMember(Member fromMember) {
		this.fromMember = fromMember;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public Member getToMember() {
		return toMember;
	}

	public void setToMember(Member toMember) {
		this.toMember = toMember;
	}

}