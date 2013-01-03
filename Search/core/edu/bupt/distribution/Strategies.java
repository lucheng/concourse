/**
 * 
 */
package edu.bupt.distribution;

import java.util.ArrayList;


public final class Strategies {
	private Strategies() {
		// DO NOTHING
	}

	public static ArrayList<DistributionStrategy> getStrategies() {

		ArrayList<DistributionStrategy> list = new ArrayList<DistributionStrategy>();

		list.add(NormalDistribution.getInstance());

		return list;

	}

}
