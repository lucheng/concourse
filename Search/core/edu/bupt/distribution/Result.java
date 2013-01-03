package edu.bupt.distribution;

public class Result {
	Result(DistributionStrategy strategy) {
		this.strategy = strategy;

	}

	public double[] getData() {
		return this.data;
	}

	public boolean isSuitable() {
		return this.suitable;
	}

	public double getExpectation() {
		return expectation;
	}

	public double getSquareDeviation() {
		return this.squaredeviation;
	}

	public CoodMappingtable getMappingtable() {
		return this.mappingTable;
	}

	public DistributionStrategy getStrategy() {
		return this.strategy;

	}

	void setMappingtable(CoodMappingtable mappingtable) {
		this.mappingTable = mappingtable;
	}

	void setData(double[] data) {
		this.data = data;
	}

	void setExpectation(double expectation) {
		this.expectation = expectation;
	}

	void setSquareDeviation(double squaredeviation) {
		this.squaredeviation = squaredeviation;
	}

	void setSuitable(boolean value) {
		this.suitable = value;
	}

	private DistributionStrategy strategy;

	private CoodMappingtable mappingTable;

	private boolean suitable;

	private double[] data;

	private double expectation;

	private double squaredeviation;

}
