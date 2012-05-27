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
import edu.bupt.spring.service.ArticleService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
@Controller("articleController")
public class ArticleController extends BaseController{
    
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Autowired
    @Qualifier("articleServiceImpl")
	private ArticleService articleService;
	
	@RequestMapping(value = "/article/list")
    public ModelAndView list(HttpServletRequest request){
		
		/*PageView<Article> pageView = new PageView<Article>(100, page);
		QueryResult<Article> qr = articleService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), " o.parent is null", queryParams.toArray(), orderby);
		pageView.setQueryResult(qr);*/
		
		
		return new ModelAndView("article/list").addObject("entity", articleService.findAll());
    }
    
    @RequestMapping(value = "/article/add", method = {RequestMethod.GET})
    public String add(Model model, HttpServletRequest request){
    	request.setAttribute("parentCategories", articleService.findFirdLevel());	
    	return "article/add";
    }
    
    @RequestMapping(value = "/article/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("article") Article article) {
    	if(article.getId() > 0){
    		articleService.update(article);
        }else {
        	articleService.save(article);
        }
        return "redirect:/article/list";
    }
    
    @RequestMapping(value = "/article/edit/{id}", method = {RequestMethod.GET})
    public String edit(@PathVariable Integer id, HttpServletRequest request) {
        
    	Article article = articleService.find(id);
    	 
    	 request.setAttribute("entity", article);
         request.setAttribute("parentCategories", articleService.findFirdLevel());
         return "article/add";
    }
    
    @RequestMapping(value = "/article/update", method = {RequestMethod.POST})
    public String update(@ModelAttribute("article") Article article, HttpServletRequest request) {
        
    	articleService.update(article);
        return "redirect:/article/list";
    }
    
    @RequestMapping(value = "/article/delete/{id}", method = {RequestMethod.GET})
    public String delete(@ModelAttribute("article") Article article, HttpServletRequest request) {
        
    	articleService.delete(article.getId());
        return "redirect:/article/list";
    }
    
    
}
