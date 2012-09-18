package edu.bupt.spring.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Score;
import edu.bupt.spring.service.ScoreService;

@Service
public class ScoreServiceImpl extends DaoSupport<Score> implements ScoreService {

	@Override
	@SuppressWarnings("unchecked")
	public List<Alias> findRelatedAlias(Alias alias) {
		
		List<Alias> aliases = new ArrayList<Alias>();
		try{
			Query query = em.createQuery("select o from Score o where (o.second.id=?1 or o.first.id=?1) order by score desc");
			query.setParameter(1, alias.getId());
			List<Score> list = (List<Score>)query.getResultList();
			for(Score score : list){
				if(alias.getId() == score.getFirst().getId()){
					aliases.add(score.getSecond());
				}else {
					aliases.add(score.getFirst());
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return aliases;
	}

	
}
