package edu.bupt.spring.service;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Entry;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
public interface EntryService extends DAO<Entry> {

	public Entry findByTitle(String title);
}
