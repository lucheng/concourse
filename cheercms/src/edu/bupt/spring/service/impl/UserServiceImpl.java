package edu.bupt.spring.service.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.User;
import edu.bupt.spring.service.UserService;

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
public class UserServiceImpl extends DaoSupport<User> implements UserService {

	public User checkLogin(String username, String password) {
		
		Query query = em.createQuery("select o from User o where username='"+ username +"'");
		User loginAdmin = (User) query.getSingleResult();
		if(loginAdmin.getPassword().equals(password)){
			return loginAdmin;
		}
		return null;
	}

	public User findByName(String name) {
		
		Query query = em.createQuery("select o from User o where username='"+ name +"'");
		return (User) query.getSingleResult();
	}

   
}