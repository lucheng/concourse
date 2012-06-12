package edu.bupt.spring.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.bupt.spring.base.BaseController;
import edu.bupt.spring.base.PageView;
import edu.bupt.spring.base.QueryResult;
import edu.bupt.spring.entity.Product;
import edu.bupt.spring.service.ProductService;
import edu.bupt.spring.service.TaobaoService;
import edu.bupt.spring.utils.JsonResponse;


@Controller("productController")
public class ProductController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name="productServiceImpl")
	private ProductService productService;
	
	@Resource(name="taobaoServiceImpl")
	private TaobaoService taobaoService;
	
	@RequestMapping("/product/list")
	public ModelAndView list(String pageSize){
		
		PageView<Product> pageView = new PageView<Product>(15, page);
		QueryResult<Product> qr = productService.getScrollData(pageView.getFirstResult(), pageView.getMaxresult(), jpql.toString(), params.toArray(), orderby);
		pageView.setQueryResult(qr);
		
		return new ModelAndView("product/list").addObject("pageView",pageView);
	}
	
	@RequestMapping(value = "/product/add")
    public String add(){
        
    	return "product/input";
    }
    
	@RequestMapping(value = "/product/fetch", method = {RequestMethod.POST})
    public String fetch(String url, HttpServletRequest request) {
        
		JsonResponse<Product> json = taobaoService.getProductByUrl(url);
		
		if(json.getCode() == JsonResponse.SUCCESS){
			productService.save(json.getObject());
		}
		
		return "redirect:/product/list";
//		return new ModelAndView("product/list_product");
    }
	
	@RequestMapping(value = "/product/list_product")
    public String list_product(HttpServletRequest request) {
        
    	
        return "redirect:/product/list";
    }
	
    @RequestMapping(value = "/product/save", method = {RequestMethod.POST})
    public String save(@ModelAttribute("brand") Product product, HttpServletRequest request) {
        
    	logger.info(product.getId()+"");
    	if(product.getId() > 0){
    		productService.update(product);
    	} else {
    		productService.save(product);
    	}
        return "redirect:/product/list";
    }
    
    @RequestMapping(value = "/product/edit/{id}", method = {RequestMethod.GET})
    public ModelAndView edit(@PathVariable Integer id, HttpServletRequest request) {
        
        return new ModelAndView("product/edit").addObject("entry",productService.find(id));
    }
}
