package edu.bupt.spring.service.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.service.EntryService;

@Service
public class EntryServiceImpl extends DaoSupport<Entry> implements EntryService {

	@Override
	public Entry findByTitle(String title) {
		
		Entry entry = null;
		try{
			Query query = em.createQuery("select o from Entry o where o.title='?1'");
			query.setParameter(1, title);
			entry = (Entry) query.getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}
		return entry;
	}
	
}
