package edu.bupt.spring.service.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Shop;
import edu.bupt.spring.service.ShopService;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */

@Service
public class ShopServiceImpl extends DaoSupport<Shop> implements ShopService {

	public Shop findByNick(String nick) {
		try{
			Query query = em.createQuery("select o from Shop o where nick='"+ nick +"'");
			return (Shop) query.getSingleResult();
		}catch(Exception e){
			return null;
		}
	}

}