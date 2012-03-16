package core.data;

import java.util.List; 

/** 
 * 数据处理接口
 * 
 * @author xgx
 *
 */
public interface DataHandler {
    
    /**
     * 获取文档中的网址
     * 
     * @param html html文档内容
     * @return
     */
    public List<String> getUrls(StringBuffer html);
    
    /**
     * 获取文档中图片地址
     * 
     * @param html html文档内容
     * @return
     */
//    public List<String> getImageUrls(StringBuffer html);
    
    /**
     * 获取文档中div的信息
     * @param html
     * @return
     */
    public List<String> getDIVUrls(StringBuffer html);
    
}



