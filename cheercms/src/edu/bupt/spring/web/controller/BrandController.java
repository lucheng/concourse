package edu.bupt.spring.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

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

import edu.bupt.spring.entity.Brand;
import edu.bupt.spring.service.BrandService;
import edu.bupt.spring.utils.ImageUtils;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("brandController")
public class BrandController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Autowired
    @Qualifier("brandServiceImpl")
	private BrandService brandService;
	
	
	@RequestMapping(value = "/brand/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<Article> pageView = new PageView<Article>(100, page);
		QueryResult<Article> qr = articleService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("brand/list").addObject("entity", brandService.findAll());
    }
    
    @RequestMapping(value = "/brand/add", method = {RequestMethod.GET})
    public String add(Model model, HttpServletRequest request){
    	return "brand/input";
    }
    
    @RequestMapping(value = "/brand/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("brand") Brand brand,@RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
    	//图片文件上传
    	for(MultipartFile file : myfiles){ 
            if(file.isEmpty()){ 
                System.out.println("文件未上传"); 
            }else{ 
            	
                Map<String, String> map = ImageUtils.getImageNewName(file.getOriginalFilename());
                
                String newFileName = map.get("name");
                String dir = map.get("dir");
              
                //如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\WEB-INF\\upload\\当前日期 \\文件夹中 
                String realpath = request.getSession().getServletContext().getRealPath("/WEB-INF/upload/" + dir); 
                //这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的 
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(realpath, newFileName));
                System.out.println("文件路径: " + request.getSession().getServletContext().getRealPath(realpath)); 
                System.out.println("文件新名: " + newFileName); 
                
                brand.setLogo(dir + newFileName);
                System.out.println(dir + newFileName);
                
            } 
        } 
    	
    	if(brand.getId() > 0){
    		brandService.update(brand);
        }else {
        	brandService.save(brand);
        }
        return "redirect:/brand/list";
    }
    
    @RequestMapping(value = "/brand/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Brand brand = brandService.find(id);
    	 
    	 request.setAttribute("entity", brand);
         return "brand/input";
    }
    
    @RequestMapping(value = "/brand/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        
    	brandService.update(brand);
        return "redirect:/brand/list";
    }
    
    @RequestMapping(value = "/brand/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        
    	brandService.delete(brand.getId());
        return "redirect:/brand/list";
    }
    
    
}
