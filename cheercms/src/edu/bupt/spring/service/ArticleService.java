package edu.bupt.spring.service;

import java.util.List;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.Article;
import edu.bupt.spring.entity.CategoryInfo;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface ArticleService extends DAO<Article> {

	public List<Article> findAll();
}
