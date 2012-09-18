package edu.bupt.spring.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 实体间关系得分
 * 
 * @author  linzhe
 * @Date    2012-9-17
 * @email   m23linzhe@gmail.com
 * @version 1.0
 *
 */

@Entity
@Table(name="tbl_Score")
public class Score extends BaseEntity {

	private static final long serialVersionUID = 1475773294701585482L;

	private Alias first;
	private Alias second;
	private double score;
	
	public Score(){
		
	}
	public Score(Alias first, Alias second, double score){
		
		if(first.getId() > second.getId()){
			this.first = first;
			this.second = second;
		} else {
			this.first = second;
			this.second = first;
		}
		this.score = score;
	}
	
	@ManyToOne(optional=false,cascade={CascadeType.REFRESH})  
    @JoinColumn(name="first_id")
	public Alias getFirst() {
		return first;
	}
	public void setFirst(Alias first) {
		this.first = first;
	}
	
	@ManyToOne(optional=false,cascade={CascadeType.REFRESH})  
    @JoinColumn(name="second_id")
	public Alias getSecond() {
		return second;
	}
	public void setSecond(Alias second) {
		this.second = second;
	}
	
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
}