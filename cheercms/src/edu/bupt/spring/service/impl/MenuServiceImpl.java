package edu.bupt.spring.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Menu;
import edu.bupt.spring.service.MenuService;

@Service
public class MenuServiceImpl extends DaoSupport<Menu> implements MenuService {

	public List<Menu> findFirdLevel() {
		Query query = em.createQuery("select o from Menu o where o.parent is null order by orderList");
		return query.getResultList();
	}
}
