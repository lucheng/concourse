package edu.bupt.spring.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.bupt.spring.base.DaoSupport;
import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.BaseEntity;
import edu.bupt.spring.entity.Score;
import edu.bupt.spring.service.ScoreService;

@Service
public class ScoreServiceImpl extends DaoSupport<Score> implements ScoreService {

	@Override
	@SuppressWarnings("unchecked")
	public List<Alias> findRelatedAlias(Alias alias) {
		
		List<Alias> aliases = new ArrayList<Alias>();
		try{
			Query query = em.createQuery("select top 4 o from Score o where (o.second.id=?1 or o.first.id=?1) order by score desc ");
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

	@Override
	public void save(BaseEntity entity) {
		
//		System.out.println("scoreList.size():" + ((Score)entity).getFirst().getId());
		
		Query query = em.createQuery("select o from Score o where o.first.id="+ ((Score)entity).getFirst().getId() +" and o.second.id="+ ((Score)entity).getSecond().getId());
		List<Score> scoreList = query.getResultList();
//		query.setParameter(1, ((Score)entity).getFirst().getId());
//		query.setParameter(2, ((Score)entity).getSecond().getId());
		
//		System.out.println("scoreList.size():" + scoreList.size());
		if(scoreList.size() == 0){
			entity.setCreateDate(new Date());
			em.persist(entity);
		} else {
			Score score = scoreList.get(0);
			if(score.getScore() < ((Score)entity).getScore()){
				score.setScore(((Score)entity).getScore());
				em.merge(score);
			}
		}
	}


	/*@Override
	public Score findTop() {
		
		Query query = em.createQuery("select o from Score o order by score desc ");
		List<Score> scoreList = query.getResultList();
		
		if(scoreList.size() == 0){
			return null;
		} else {
			return scoreList.get(0);
		}
		
	}*/
	
}
