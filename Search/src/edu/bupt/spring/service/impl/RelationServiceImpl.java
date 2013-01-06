package edu.bupt.spring.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Article;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.service.RelationService;

@Service
public class RelationServiceImpl extends DaoSupport<Relation> implements RelationService {

	@Override
	public List<Relation> findByAlias(Alias alias) {
		
		List<Relation> result = new ArrayList<Relation>();
		try{
			Query query = em.createQuery("select o from Relation o where o.alias.id=?1 order by o.relationship desc limit 0 to 8");
			query.setParameter(1, alias.getId());
			result = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Relation> findByAliasAndArticle(Alias alias, Article article) {
		
		List<Relation> result = new ArrayList<Relation>();
		try{
			Query query = em.createQuery("select o from Relation o where o.alias.id=?1 and  o.article.id=?2 order by o.relationship desc limit 0 to 8");
			query.setParameter(1, alias.getId());
			query.setParameter(2, article.getId());
			result = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
}
