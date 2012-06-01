package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;


import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.MemberRank;
import edu.bupt.spring.service.MemberRankService;

@Service
public class MemberRankServiceImpl extends DaoSupport<MemberRank> implements MemberRankService {

	public List<MemberRank> findAll() {
		Query query = em.createQuery("select o from MemberRank o ");
		return query.getResultList();
	}

	

}
