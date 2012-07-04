package edu.bupt.spring.entity;

import java.util.Date;

import javax.persistence.Entity;
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
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Entity
@Table(name = "share_admin")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Admin extends BaseEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{username.illegal}") //java validator验证（用户名字母数字组成，长度为5-10）
    private String username;
    
//    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{username.illegal}") 
    private String name;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String password;
    
    @NotNull
    @Size(min = 1, max = 255)
    @NotEmpty(message = "{email.illegal}")
    @Email(message = "{email.illegal}") //错误消息会自动到MessageSource中查找
    private String email;
    
    private String department;
    
    @DateFormat( message="{register.date.error}")//自定义的验证器
    private Date loginDate;
    
    private String loginIp;
    
    private boolean isAccountEnabled;
    

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


}