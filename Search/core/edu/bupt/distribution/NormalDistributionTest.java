package edu.bupt.distribution;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class NormalDistributionTest {
	@Before
	public void setUp() {
		normal = (NormalDistribution) Strategies.getStrategies().get(0);
	}

	@After
	public void cleanUp() {

	}

	@Test
	public void testCalc() {

		Assert.assertEquals(0.5, normal.Calc(0), 0.001);
		Assert.assertEquals(0.5040, normal.Calc(0.01), 0.001);
		Assert.assertEquals(0.7580, normal.Calc(0.7), 0.001);
		Assert.assertEquals(0.9861, normal.Calc(2.2), 0.001);

		Assert.assertEquals(1 - 0.5040, normal.Calc(-0.01), 0.001);
		Assert.assertEquals(1 - 0.7580, normal.Calc(-0.7), 0.001);
		Assert.assertEquals(1 - 0.9861, normal.Calc(-2.2), 0.001);

	}

	@Test
	public void testExAndDev() {
		double data[] = new double[10];
		java.util.Arrays.fill(data, 12);
		Result result = normal.getResult(data);
		Assert.assertEquals(0, result.getSquareDeviation(), 0.001);
		Assert.assertEquals(12, result.getExpectation(), 0.001);

	}

	@Test
	public void testMappingtable() {
		double data[] = new double[10];
		java.util.Arrays.fill(data, 12);
		CoodMappingtable table = normal.getResult(data).getMappingtable();

		Assert.assertEquals(-3, table.coodYmapping(0.0001), 0.01);
		Assert.assertEquals(3, table.coodYmapping(0.9999), 0.01);
		Assert.assertEquals(0, table.coodYmapping(0.5), 0.01);
		Assert.assertEquals(1.14, table.coodYmapping(0.8729), 0.01);
		Assert.assertEquals(2.65, table.coodYmapping(0.9960), 0.01);
	}

	@Test
	public void testSuitable() {
		double[] data = { 5, 6.01, 6.80, 7.50, 8.04, 8.94, 9.9, 10.31, 11.45 };
		Result temp = normal.getResult(data);
		System.out.println("期望：" + temp.getExpectation());
		System.out.println("方差：" + temp.getSquareDeviation());
		Assert.assertTrue(temp.isSuitable());
	}

	@Test
	public void testNotSuitable() {
		double[] data = { 0, 0, 0, 0, 0, 3, 3, 3, 3, 3 };
		Result temp = normal.getResult(data);
		Assert.assertTrue(!temp.isSuitable());
	}

	private NormalDistribution normal;

}
