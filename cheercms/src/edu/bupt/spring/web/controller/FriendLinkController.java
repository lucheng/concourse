package edu.bupt.spring.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.entity.FriendLink;
import edu.bupt.spring.service.FriendLinkService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("friendLinkController")
public class FriendLinkController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(FriendLinkController.class);
	
	@Autowired
    @Qualifier("friendLinkServiceImpl")
	private FriendLinkService friendLinkService;
	
	@RequestMapping(value = "/friendLink/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<Article> pageView = new PageView<Article>(100, page);
		QueryResult<Article> qr = articleService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("friendLink/list").addObject("entity", friendLinkService.findAll());
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
                
                
                String fileName = file.getOriginalFilename();
                int random = (int) (Math.random() * 10000);
                Long  time = System.currentTimeMillis();
                String newFileName = time.toString() + random + fileName.substring(fileName.lastIndexOf("."));
                
                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String DateSuffix = dateFormat.format(date);
                
              
                //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\文件夹中 
                String realpath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload/"+DateSuffix); 
                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的 
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realpath, newFileName));
                System.out.println("文件路径: " + request.getSession().getServletContext().getRealPath(realpath)); 
                System.out.println("文件新名: " + newFileName); 
                
                friendLink.setLogo("/WEB-INF/upload/" + DateSuffix + "/" + newFileName);
                
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
        
    	friendLinkService.delete(friendLink.getId());
        return "redirect:/friendLink/list";
    }
    
    
}
