package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Category;
import edu.bupt.spring.service.CategoryService;

@Service
public class CategoryServiceImpl extends DaoSupport<Category> implements CategoryService {

	public List<Category> findAll() {
		Query query = em.createQuery("select o from Category o ");
		return query.getResultList();
	}

	public List<Category> findFirdLevel() {
		Query query = em.createQuery("select o from Category o where o.parent is null");
		return query.getResultList();
	}

	

}
