package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.entity.Article;
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
    public String add(Model model, HttpServletRequest request){
    	return "friendLink/add";
    }
    
    @RequestMapping(value = "/friendLink/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("friendLink") FriendLink friendLink) {
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
         return "friendLink/add";
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
