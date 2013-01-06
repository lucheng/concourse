package edu.bupt.spring.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

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

import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Query;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.entity.Score;
import edu.bupt.spring.pager.PageView;
import edu.bupt.spring.pager.QueryResult;
import edu.bupt.spring.service.AliasService;
import edu.bupt.spring.service.ArticleService;
import edu.bupt.spring.service.RelationService;
import edu.bupt.spring.service.ScoreService;

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
	
	@Autowired
    @Qualifier("articleServiceImpl")
	private ArticleService articleService;
	
	@Autowired
    @Qualifier("scoreServiceImpl")
	private ScoreService scoreService;
	
	
	@Autowired
    @Qualifier("aliasServiceImpl")
	private AliasService aliasService;
	
    @RequestMapping(value="/view",method=RequestMethod.POST)
    public String view(@Valid Query query, ModelMap map, HttpServletRequest request){
    	
    	Alias alias = aliasService.findByTitle(query.getQuery());
    	
    	if(alias == null){
    		
    		request.setAttribute("javax.servlet.error.message", "没有查询的实体！");
    		return "error";
    	}
    	
    	StringBuffer wherejpql = new StringBuffer();
    	LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
    	List<Object> params = new ArrayList<Object>();
    	
    	wherejpql.append(" o.alias.id=?1 ");
    	params.add(alias.getId());
    	
    	orderby.put("relationship", "desc");
		PageView<Relation> pageView = new PageView<Relation>(10, page);
		QueryResult<Relation> qr = relationService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), wherejpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
    	
		
		StringBuffer jpql = new StringBuffer();
		LinkedHashMap<String, String> orderby1 = new LinkedHashMap<String, String>();
    	List<Object> params1 = new ArrayList<Object>();
    	
		jpql.append("(o.first.id=?1 or o.second.id=?1)");
    	params1.add(alias.getId());
    	orderby1.put("score", "desc");
    	PageView<Score> aliasView = new PageView<Score>(10, page);
    	QueryResult<Score> qrAlias = scoreService.getScrollData(aliasView.getFirstResult(), aliasView.getMaxresult(), jpql.toString(), params1.toArray(), orderby1);
    	aliasView.setQueryResult(qrAlias);
    	
    	List<Score> list = aliasView.getRecords();
    	List<Alias> data = new ArrayList<Alias>();
    	
    	for(Score s : list){
    		if(s.getSecond().getId() == alias.getId()){
    			if(!data.contains(s.getFirst())){
    				data.add(s.getFirst());
    			}
    		}else {
    			if(!data.contains(s.getSecond())){
    				data.add(s.getSecond());
    			}
    		}
    		
    	}
    	
    	map.put("aliases", data);
    	map.put("entry", alias);
    	map.put("pageView", pageView);
        
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
    public String create(@Valid Alias entry,BindingResult binding){
    	
    	if(binding.hasErrors()) {
			return "error";
		}
//		users.put(user.getUsername(), user);
        return "show";
    }
}
