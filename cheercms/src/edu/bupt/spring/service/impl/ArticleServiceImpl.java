package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Article;
import edu.bupt.spring.service.ArticleService;

@Service
public class ArticleServiceImpl extends DaoSupport<Article> implements ArticleService {

	public List<Article> findAll() {
		Query query = em.createQuery("select o from Article o ");
		return query.getResultList();
	}

}
