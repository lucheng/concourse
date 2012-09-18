package edu.bupt.spring.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.service.RelationService;

@Service
public class RelationServiceImpl extends DaoSupport<Relation> implements RelationService {

	@Override
	public List<Relation> findByAlias(Alias alias) {
		
		List<Relation> result = new ArrayList<Relation>();
		try{
			Query query = em.createQuery("select o from Relation o where o.alias.id=?1 order by o.relationship desc");
			query.setParameter(1, alias.getId());
			result = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
}
