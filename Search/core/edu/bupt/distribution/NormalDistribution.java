package edu.bupt.distribution;

import java.lang.Math;

public class NormalDistribution implements DistributionStrategy {
	private NormalDistribution() {

	}

	protected static NormalDistribution getInstance() {
		if (instance == null)
			instance = new NormalDistribution();
		return instance;
	}

	public Result getResult(double[] data) {
		
		double[] datatemp;

		datatemp = data.clone();
		java.util.Arrays.sort(datatemp);

		/**
		 * 估算期望和方差
		 * 
		 */
		double expectation = 0, deviation = 0;
		
		for (int i = 0; i < data.length; i++) {
			expectation += data[i];
		}
		expectation /= data.length;
		for(int i=0;i<data.length;i++){
			deviation+=(data[i]-expectation)*(data[i]-expectation);
			
		}
		
		deviation /= data.length;
		//deviation = deviation - expectation * expectation;
		Result result = new Result(this);

		result.setData(datatemp);
		result.setExpectation(expectation);
		result.setSquareDeviation(deviation);
		if (table == null)
			table = this.new NormalMappingtable();
		result.setMappingtable(table);
		result.setSuitable(isSuitable(data));
		return result;
	}

	/**
	 * 计算标准正态分布，做坐标变换时会用到
	 */
	public double Calc(double data) {
		double step = 0.0001;

		double result;

		result = 0.5;
		for (double currentX = 0; currentX < java.lang.Math.abs(data); currentX += step) {
			result += calctransient(currentX) * step;
		}
		if (data <= 0)
			result = 1 - result;

		return result;

	}

	private boolean isSuitable(double[] data) {
		double transformedCoodinate[] = new double[data.length];
		double result;
		for (int i = 0; i < data.length; i++) {
			if (data.length > 20)
				transformedCoodinate[i] = table.coodYmapping(i / data.length);
			else
				transformedCoodinate[i] = table.coodYmapping((i - 0.3+1)
						/ (data.length + 0.4));// 使用中位秩
		}
		double Xsum = 0, Ysum = 0, sqrXsum = 0, sqrYsum = 0, xysum = 0;
		;
		for (int i = 0; i < data.length; i++) {
			Xsum += data[i];
			Ysum += transformedCoodinate[i];
			xysum = data[i] * transformedCoodinate[i];
			sqrXsum += data[i] * data[i];
			sqrYsum += transformedCoodinate[i] * transformedCoodinate[i];

		}
		result = (xysum - Xsum * Ysum / data.length)
				/ Math.sqrt((sqrXsum - Xsum * Xsum / data.length)
						* (sqrYsum - Ysum * Ysum / data.length));
		if (result >= (2.576 / (Math.sqrt(data.length + 1))))
			return true;
		else
			return false;

	}

	private static double calctransient(double x) {
		return Math.sqrt(1 / (2 * Math.PI)) * Math.exp((-0.5) * x * x);
	}

	private static CoodMappingtable table;

	private static NormalDistribution instance;

	/**
	 * 
	 * 用于坐标映射变换的策略类
	 */
	class NormalMappingtable implements CoodMappingtable {
		private double YMappingtable[][] = new double[601][2];

		NormalMappingtable() {
			for (int i = 0; i < YMappingtable.length; i++) {
				YMappingtable[i][0] = (-3) + i * 0.01;
				YMappingtable[i][1] = Calc(YMappingtable[i][0]);
			}
		}

		public double coodXmapping(double coodX) {
			return coodX;
		}

		public double coodYmapping(double coodY) {
			double result;
			if (coodY < YMappingtable[0][1])
				return YMappingtable[0][0];
			if (coodY > YMappingtable[600][1])
				return YMappingtable[600][0];
			for (int i = 0; i < 600; i++) {

				if (coodY >= YMappingtable[i][1]
						&& coodY < YMappingtable[i + 1][1]) {

					result = ((coodY - YMappingtable[i][1]) / (YMappingtable[i + 1][1] - YMappingtable[i][1]))
							* (YMappingtable[i + 1][0] - YMappingtable[i][0])
							+ YMappingtable[i][0];
					return result;
				}
			}
			return 0;
		}

	}

	public String getStrategyName() {
		
		return "正态分布";
	}

}

