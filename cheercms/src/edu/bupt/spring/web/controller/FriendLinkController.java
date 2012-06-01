package edu.bupt.spring.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.entity.FriendLink;
import edu.bupt.spring.pager.PageParam;
import edu.bupt.spring.pager.PageView;
import edu.bupt.spring.pager.QueryResult;
import edu.bupt.spring.service.FriendLinkService;
import edu.bupt.spring.utils.ImageUtils;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-29
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
@Controller("friendLinkController")
public class FriendLinkController extends BaseController{
    
//	private static final Logger logger = LoggerFactory.getLogger(FriendLinkController.class);
	
	@Autowired
    @Qualifier("friendLinkServiceImpl")
	private FriendLinkService friendLinkService;
	
	@RequestMapping(value = "/friendLink/list")
    public ModelAndView list(HttpServletRequest request){
		
		pageparam = new PageParam(request);
		
		PageView<FriendLink> pageView = new PageView<FriendLink>(pageparam.getPageSize(), pageparam.getPageNumber());
//		QueryResult<FriendLink> qr = friendLinkService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), "", pageparam.getQueryParams().toArray(), pageparam.getOrderby());
		QueryResult<FriendLink> qr = friendLinkService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), pageparam);
		pageView.setQueryResult(qr);
		
		return new ModelAndView("friendLink/list").addObject("pageView", pageView).addObject("pageparam", pageparam);
    }
    
    @RequestMapping(value = "/friendLink/add", method = {RequestMethod.GET})
    public String add(Model model,  HttpServletRequest request){ 
    	
    	return "friendLink/input";
    }
    
    @RequestMapping(value = "/friendLink/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("friendLink") FriendLink friendLink, @RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
    	//图片文件上传
    	for(MultipartFile file : myfiles){ 
            if(file.isEmpty()){ 
                System.out.println("文件未上传"); 
            }else{ 
            	
                System.out.println("文件长度: " + file.getSize()); 
                System.out.println("文件类型: " + file.getContentType()); 
                System.out.println("文件名称: " + file.getName());
                
                System.out.println("文件原名: " + file.getOriginalFilename()); 
                System.out.println("========================================");
                
                //重命名图片
                /*String fileName = file.getOriginalFilename();
                int random = (int) (Math.random() * 10000);
                Long  time = System.currentTimeMillis();
                String newFileName = time.toString() + random + fileName.substring(fileName.lastIndexOf("."));
                
                //获取当前日期
                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");*/
                Map<String, String> map = ImageUtils.getImageNewName(file.getOriginalFilename());
                
                String newFileName = map.get("name");
                String dir = map.get("dir");
              
                //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\当前日期 \\文件夹中 
                String realpath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload/" + dir); 
                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的 
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realpath, newFileName));
                System.out.println("文件路径: " + request.getSession().getServletContext().getRealPath(realpath)); 
                System.out.println("文件新名: " + newFileName); 
                
                friendLink.setLogo(dir + newFileName);
                System.out.println(dir + newFileName);
                
            } 
        } 
    	
    	
    	if(friendLink.getId() > 0){
    		friendLinkService.update(friendLink);
        }else {
        	friendLinkService.save(friendLink);
        }
        return "redirect:/friendLink/list";
    }
    
    @RequestMapping(value = "/friendLink/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	FriendLink friendLink = friendLinkService.find(id);
    	 
    	 request.setAttribute("entity", friendLink);
         return "friendLink/input";
    }
    
    @RequestMapping(value = "/friendLink/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("friendLink") FriendLink friendLink, HttpServletRequest request) {
        
    	friendLinkService.update(friendLink);
        return "redirect:/friendLink/list";
    }
    
    @RequestMapping(value = "/friendLink/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("friendLink") FriendLink friendLink, HttpServletRequest request) {
        
    	boolean del = friendLinkService.deleteEntity(friendLink);
    	
    	 System.out.println("del:" + del);
    	
    	if(del){
    		String path = "/cheercms/upload/" + friendLink.getLogo();
    		java.io.File file = new java.io.File(path); 
    		file.delete();
    		System.out.println("file1:" + friendLink.getLogo());
    		System.out.println("file2:" + file);
    	}
    	
        return "redirect:/friendLink/list";
    }
    
    
}
