package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.BaseEntity;
import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.service.RelationService;

@Service
public class RelationServiceImpl extends DaoSupport<Relation> implements RelationService {

	@Override
	public void save(BaseEntity entity) {
		
		
		super.save(entity);
	}

	@Override
	public List<Relation> findByEntry(Entry entry) {
		
		Query query = em.createQuery("select o from Relation o where o.entry.id=?1 order by o.relationship desc");
		query.setParameter(1, entry.getId());
		return query.getResultList();
		
	}
	
}
