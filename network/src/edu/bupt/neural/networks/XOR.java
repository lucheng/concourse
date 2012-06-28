package edu.bupt.neural.networks;

import org.encog.ml.data.MLData;
import org.encog.ml.data.MLDataPair;
import org.encog.neural.data.NeuralData;
import org.encog.neural.data.NeuralDataPair;
import org.encog.neural.data.NeuralDataSet;
import org.encog.neural.data.basic.BasicNeuralDataSet;
import org.encog.neural.networks.BasicNetwork;
import org.encog.neural.networks.layers.BasicLayer;
import org.encog.neural.networks.training.Train;
import org.encog.neural.networks.training.propagation.resilient.ResilientPropagation;

public class XOR {

	public static double XOR_INPUT[][] = {
									{ 0.0, 0.0 },
									{ 1.0, 0.0 },
									{ 0.0, 1.0 },
									{ 1.0, 1.0 } };
	public static double XOR_IDEAL[][] = {
									{ 0.0 },
									{ 1.0 },
									{ 1.0 },
									{ 0.0 } };
	
	public static void main(String[] args) {
		
		BasicNetwork network = new BasicNetwork();
		network.addLayer(new BasicLayer(2));
		network.addLayer(new BasicLayer(2));
		network.addLayer(new BasicLayer(1));
		network.getStructure().finalizeStructure();
		network.reset();

		NeuralDataSet trainingSet = new BasicNeuralDataSet(XOR_INPUT, XOR_IDEAL);
		
		final Train train = new ResilientPropagation(network, trainingSet);
		
		int epoch = 1;
		do {
			train.iteration();
			System.out.println("Epoch #" + epoch + " Error:" + train.getError());
			epoch++;
			
			System.out.println("Neural Network Results:");
			for(MLDataPair pair: trainingSet ) {
				final MLData output = network.compute(pair.getInput());
				System.out.println(pair.getInput().getData(0) + "," + pair.getInput().getData(1)
				+ ", actual=" + output.getData(0) + ",ideal=" +
				pair.getIdeal().getData(0));
			}
		
		} while(train.getError() > 0.01);
		
		
	}

}
