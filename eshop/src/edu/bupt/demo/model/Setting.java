package edu.bupt.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * User: linzhe
 * Date: 12-1-4 下午3:12
 * Version: 1.0
 */
@Entity
@Table(name = "tbl_setting")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Setting {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private int id;
    
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{username.illegal}") //java validator验证（用户名字母数字组成，长度为5-10）
    private String shopName;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String shopUrl;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String hotSearch;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String address;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String phone;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String zipCode;
    
    @NotEmpty(message = "{email.illegal}")
    @Email(message = "{email.illegal}") //错误消息会自动到MessageSource中查找
    private String email;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String certtext;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String metaKeywords;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String metaDescription;
    
    /**
     * 商品图片(大)
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int bigGoodsImageWidth;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int bigGoodsImageHeight;
    
    /**
     * 商品图片(小)
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int smallGoodsImageWidth;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int smallGoodsImageHeight;
    
    /**
     * 商品缩略图
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int thumbnailGoodsImageWidth;
    
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int thumbnailGoodsImageHeight;
    
    /**
     * 会员注册设置
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int isRegisterEnabled;
    
    /**
     * 是否自动锁定账号
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int isLoginFailureLock;
    
    /**
     * 连续登录失败最大次数
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int loginFailureLockCount;
    
    /**
     * 自动解锁时间
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int loginFailureLockTime;
    
    /**
     * 发件人邮箱
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String smtpFromMail;
    
    /**
     * SMTP服务器地址
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String smtpHost;
    
    /**
     * SMTP服务器端口
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int smtpPort;
    
    /**
     * SMTP用户名
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String smtpUsername;
    
    /**
     * SMTP密码
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private String smtpPassword;
    
    /**
     * 价格精确位数
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int priceScale;
    
    /**
     * HTML自动生成延时
     */
    @Pattern(regexp = "[A-Za-z0-9]{5,20}", message = "{password.illegal}") 
    private int buildHtmlDelayTime;
    
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    
    public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopUrl() {
		return shopUrl;
	}
	public void setShopUrl(String shopUrl) {
		this.shopUrl = shopUrl;
	}
	public String getHotSearch() {
		return hotSearch;
	}
	public void setHotSearch(String hotSearch) {
		this.hotSearch = hotSearch;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCerttext() {
		return certtext;
	}
	public void setCerttext(String certtext) {
		this.certtext = certtext;
	}
	public String getMetaKeywords() {
		return metaKeywords;
	}
	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}
	public String getMetaDescription() {
		return metaDescription;
	}
	public void setMetaDescription(String metaDescription) {
		this.metaDescription = metaDescription;
	}
	public int getBigGoodsImageWidth() {
		return bigGoodsImageWidth;
	}
	public void setBigGoodsImageWidth(int bigGoodsImageWidth) {
		this.bigGoodsImageWidth = bigGoodsImageWidth;
	}
	public int getBigGoodsImageHeight() {
		return bigGoodsImageHeight;
	}
	public void setBigGoodsImageHeight(int bigGoodsImageHeight) {
		this.bigGoodsImageHeight = bigGoodsImageHeight;
	}
	public int getSmallGoodsImageWidth() {
		return smallGoodsImageWidth;
	}
	public void setSmallGoodsImageWidth(int smallGoodsImageWidth) {
		this.smallGoodsImageWidth = smallGoodsImageWidth;
	}
	public int getSmallGoodsImageHeight() {
		return smallGoodsImageHeight;
	}
	public void setSmallGoodsImageHeight(int smallGoodsImageHeight) {
		this.smallGoodsImageHeight = smallGoodsImageHeight;
	}
	public int getThumbnailGoodsImageWidth() {
		return thumbnailGoodsImageWidth;
	}
	public void setThumbnailGoodsImageWidth(int thumbnailGoodsImageWidth) {
		this.thumbnailGoodsImageWidth = thumbnailGoodsImageWidth;
	}
	public int getThumbnailGoodsImageHeight() {
		return thumbnailGoodsImageHeight;
	}
	public void setThumbnailGoodsImageHeight(int thumbnailGoodsImageHeight) {
		this.thumbnailGoodsImageHeight = thumbnailGoodsImageHeight;
	}
	public int getIsRegisterEnabled() {
		return isRegisterEnabled;
	}
	public void setIsRegisterEnabled(int isRegisterEnabled) {
		this.isRegisterEnabled = isRegisterEnabled;
	}
	public int getIsLoginFailureLock() {
		return isLoginFailureLock;
	}
	public void setIsLoginFailureLock(int isLoginFailureLock) {
		this.isLoginFailureLock = isLoginFailureLock;
	}
	public int getLoginFailureLockCount() {
		return loginFailureLockCount;
	}
	public void setLoginFailureLockCount(int loginFailureLockCount) {
		this.loginFailureLockCount = loginFailureLockCount;
	}
	public int getLoginFailureLockTime() {
		return loginFailureLockTime;
	}
	public void setLoginFailureLockTime(int loginFailureLockTime) {
		this.loginFailureLockTime = loginFailureLockTime;
	}
	public String getSmtpFromMail() {
		return smtpFromMail;
	}
	public void setSmtpFromMail(String smtpFromMail) {
		this.smtpFromMail = smtpFromMail;
	}
	public String getSmtpHost() {
		return smtpHost;
	}
	public void setSmtpHost(String smtpHost) {
		this.smtpHost = smtpHost;
	}
	public int getSmtpPort() {
		return smtpPort;
	}
	public void setSmtpPort(int smtpPort) {
		this.smtpPort = smtpPort;
	}
	public String getSmtpUsername() {
		return smtpUsername;
	}
	public void setSmtpUsername(String smtpUsername) {
		this.smtpUsername = smtpUsername;
	}
	public String getSmtpPassword() {
		return smtpPassword;
	}
	public void setSmtpPassword(String smtpPassword) {
		this.smtpPassword = smtpPassword;
	}
	public int getPriceScale() {
		return priceScale;
	}
	public void setPriceScale(int priceScale) {
		this.priceScale = priceScale;
	}
	public int getBuildHtmlDelayTime() {
		return buildHtmlDelayTime;
	}
	public void setBuildHtmlDelayTime(int buildHtmlDelayTime) {
		this.buildHtmlDelayTime = buildHtmlDelayTime;
	}
	public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Setting other = (Setting) obj;
        if (id != other.id)
            return false;
        return true;
    }
}
