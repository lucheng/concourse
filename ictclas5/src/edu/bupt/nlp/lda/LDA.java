/*
 * Copyright (C) 2007 by
 * 
 * 	Xuan-Hieu Phan
 *	hieuxuan@ecei.tohoku.ac.jp or pxhieu@gmail.com
 * 	Graduate School of Information Sciences
 * 	Tohoku University
 * 
 *  Cam-Tu Nguyen
 *  ncamtu@gmail.com
 *  College of Technology
 *  Vietnam National University, Hanoi
 *
 * JGibbsLDA is a free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published
 * by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 *
 * JGibbsLDA is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with JGibbsLDA; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
 */

package edu.bupt.nlp.lda;

public class LDA {

	public static void main(String args[]) {
		
		Option option = new Option();

		option.dir = "model";
		option.dfile = "docs.dat";
//		option.dfile = "docs.dat";
		option.est = true;  //////开关设置
		
//		决定是否是基于先前已有的模型基础上继续用新数据训练模型
		option.estc = false;
		
//		是否使用先前已经训练好的模型进行推断
		option.inf = false;
		
		option.modelName = "model-final";
		
		if (option.est || option.estc) {
			Estimator estimator = new Estimator();
			estimator.init(option);
			estimator.estimate();
			
		} else if (option.inf) {
			
			Inferencer inferencer = new Inferencer();
			inferencer.init(option);

			Model newModel = inferencer.inference();

			for (int i = 0; i < newModel.phi.length; ++i) {
				// phi: K * V
				System.out.println("-----------------------\ntopic" + i + " : ");
				for (int j = 0; j < 100; ++j) {
					System.out.println(inferencer.globalDict.id2word.get(j) + "\t" + newModel.phi[i][j]);
				}
			}
		}

	}

}
