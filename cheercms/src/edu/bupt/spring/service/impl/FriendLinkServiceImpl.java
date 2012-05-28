package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.FriendLink;
import edu.bupt.spring.service.FriendLinkService;

@Service
public class FriendLinkServiceImpl extends DaoSupport<FriendLink> implements FriendLinkService {

	public List<FriendLink> findAll() {
		Query query = em.createQuery("select o from FriendLink o ");
		return query.getResultList();
	}
	

}
