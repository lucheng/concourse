package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.ProductCategory;
import edu.bupt.spring.service.ProductCategoryService;

@Service
public class ProductCategoryServiceImpl extends DaoSupport<ProductCategory> implements ProductCategoryService {

	public List<ProductCategory> findAll() {
		Query query = em.createQuery("select o from ProductCategory o ");
		return query.getResultList();
	}

	public List<ProductCategory> findFirdLevel() {
		Query query = em.createQuery("select o from ProductCategory o where o.parent is null");
		return query.getResultList();
	}

	public boolean checkSign(String path) {
		
		Query query = em.createQuery("select o from ProductCategory o where o.path='"+ path +"'");
		if(query.getResultList().size() > 0){
			return false;
		}
		return true;
	}

	

}
