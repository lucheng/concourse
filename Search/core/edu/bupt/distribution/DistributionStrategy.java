package edu.bupt.distribution;

public interface DistributionStrategy {
	
	public Result getResult(double[] data);
	public String getStrategyName();
}
