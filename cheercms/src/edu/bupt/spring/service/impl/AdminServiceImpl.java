package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Admin;
import edu.bupt.spring.service.AdminService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service
public class AdminServiceImpl extends DaoSupport<Admin> implements AdminService {

    private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	public List<Admin> findByType(String type) {
		return null;
	}

	public List<Admin> findAll() {
		
		Query query = em.createQuery("select o from Admin o ");
		return query.getResultList();
	}

	public Admin checkLogin(String username, String password) {
		
		Query query = em.createQuery("select o from Admin o where username='"+ username +"'");
		Admin loginAdmin = (Admin) query.getSingleResult();
		if(loginAdmin.getPassword().equals(password)){
			return loginAdmin;
		}
		return null;
	}
   
}