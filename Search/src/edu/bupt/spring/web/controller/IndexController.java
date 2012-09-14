package edu.bupt.spring.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.entity.Query;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.service.ArticleService;
import edu.bupt.spring.service.EntryService;
import edu.bupt.spring.service.RelationService;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-26
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Controller("indexController")
public class IndexController extends BaseController {
    
	@Autowired
    @Qualifier("relationServiceImpl")
	private RelationService relationService;
	
//	@Resource(name="introductionServiceBean")private IntroductionService introductionService;
	/*@Autowired
    @Qualifier("articleServiceImpl")
	private static ArticleService articleService;*/
	
	@Autowired
    @Qualifier("entryServiceImpl")
	private EntryService entryService;
	
    @RequestMapping(value="/view",method=RequestMethod.POST)
    public String view(@Valid Query query, ModelMap map){
    	
    	System.out.println(query.getQuery());
//    	Entry entry = entryService.find(1);
    	Entry entry = entryService.findByTitle(query.getQuery());
    	List<Relation> relations = relationService.findByEntry(entry);
    	map.put("entry", entry);
    	map.put("relations", relations);
        
    	return "view";
    }
    
    @RequestMapping(value="/index")
    public ModelAndView index(HttpServletRequest request){
    	
    	
        return new ModelAndView("index").addObject("entity", "");
    }
    
    @RequestMapping(value = "/create")
    public ModelAndView create(){
        return new ModelAndView("create");
    }
    
    @RequestMapping(value = "/create",method=RequestMethod.POST)
    public String create(@Valid Entry entry,BindingResult binding){
    	
    	if(binding.hasErrors()) {
			return "error";
		}
//		users.put(user.getUsername(), user);
        return "show";
    }
}
