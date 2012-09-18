package edu.bupt.spring.service.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.service.AliasService;

@Service
public class AliasServiceImpl extends DaoSupport<Alias> implements AliasService {

	@Override
	public Alias findByTitle(String title) {
		
		try{
			Query query = em.createQuery("select o from Alias o where o.title='"+ title +"'");
			return (Alias) query.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}
	
}
