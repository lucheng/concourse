package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.ArticleCategory;
import edu.bupt.spring.service.ArticleCategoryService;

@Service
public class ArticleCategoryServiceImpl extends DaoSupport<ArticleCategory> implements ArticleCategoryService {

	public List<ArticleCategory> findAll() {
		Query query = em.createQuery("select o from ArticleCategory o ");
		return query.getResultList();
	}

	public List<ArticleCategory> findFirdLevel() {
		Query query = em.createQuery("select o from ArticleCategory o where o.parent is null");
		return query.getResultList();
	}

	

}
