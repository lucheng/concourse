package edu.bupt.spring.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * 用户表
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Entity
@Table(name = "share_member")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Member extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    private String username;
    private String name;
    private String password;
    private String email;
    private String department;
    
    private Date loginDate;
    private String loginIp;
    private boolean isAccountEnabled;
    
    private Set<Comment> comments = new HashSet<Comment>();
    
	private Set<Member> owners = new HashSet<Member>();
    private Set<Member> fans = new HashSet<Member>();
    
    
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isAccountEnabled() {
		return isAccountEnabled;
	}

	public void setAccountEnabled(boolean isAccountEnabled) {
		this.isAccountEnabled = isAccountEnabled;
	}

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="member")
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	/***********************************/
	/**** id owner_id fans_id ********/
	/**********************************/
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "share_owner_fans", joinColumns = { @JoinColumn(name ="owner_id" )}, inverseJoinColumns = { @JoinColumn(name = "fans_id") })
    @OrderBy("id")
	public Set<Member> getOwners() {
		return owners;
	}

	public void setOwners(Set<Member> owners) {
		this.owners = owners;
	}
	
    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, mappedBy = "owners", fetch = FetchType.LAZY)
	public Set<Member> getFans() {
		return fans;
	}

	public void setFans(Set<Member> fans) {
		this.fans = fans;
	}

}
