package edu.bupt.spring.service;

import java.util.List;

import edu.bupt.spring.base.DAO;
import edu.bupt.spring.entity.ArticleCategory;

/**
 * 
 * @author linzhe
 * @date   2012-5-17
 * @email  m23linzhe@gmail.com
 */
public interface ArticleCategoryService extends DAO<ArticleCategory> {

	public List<ArticleCategory> findAll();
	public List<ArticleCategory> findFirdLevel();
	public boolean checkSign(String sign);
}
