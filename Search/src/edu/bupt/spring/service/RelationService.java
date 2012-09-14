package edu.bupt.spring.service;

import java.util.List;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.entity.Relation;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-27
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
public interface RelationService extends DAO<Relation> {

	public List<Relation> findByEntry(Entry entry);

}