package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.User;
import edu.bupt.spring.entity.Resource;
import edu.bupt.spring.service.ResourceService;

/**
 * 
 * @author  linzhe
 * @Date    2012-6-1
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Service
public class ResourceServiceImpl extends DaoSupport<Resource> implements ResourceService {

    /*private static final Logger logger = LoggerFactory.getLogger(ResourceServiceImpl.class);

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
	}*/

   
}