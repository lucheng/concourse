package edu.bupt.demo.model;


/**
 * 用于Ajax提交用
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public class AjaxInfo {

    public static final String STATUS_YES = "y";
    public static final String STATUS_NO = "n";

    private String info = "成功";
    private String status = AjaxInfo.STATUS_YES;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
