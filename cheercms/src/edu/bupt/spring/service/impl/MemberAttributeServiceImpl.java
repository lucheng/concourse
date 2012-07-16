package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.MemberAttribute;
import edu.bupt.spring.entity.MemberRank;
import edu.bupt.spring.service.MemberAttributeService;

@Service
public class MemberAttributeServiceImpl extends DaoSupport<MemberAttribute> implements MemberAttributeService {

	public List<MemberAttribute> findAll() {
		Query query = em.createQuery("select o from MemberAttribute o ");
		return query.getResultList();
	}

	

}
