package edu.bupt.spring.service;

import java.util.List;


import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Admin;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface AdminService extends DAO<Admin> {

	public List<Admin> findByType(String type);
	public List<Admin> findAll();
	public Admin checkLogin(String username, String password);
}