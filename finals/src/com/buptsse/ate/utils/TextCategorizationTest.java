package com.buptsse.ate.utils;

import weka.core.*;
import weka.core.converters.*;
import weka.classifiers.trees.*;
import weka.filters.*;
import weka.filters.unsupervised.attribute.*;

import java.io.*;

/**
 * 10 * Example class that converts HTML files stored in a directory structure
 * into 11 * and ARFF file using the TextDirectoryLoader converter. It then
 * applies the 12 * StringToWordVector to the data and feeds a J48 classifier
 * with it. 13 * 14 * @author FracPete (fracpete at waikato dot ac dot nz) 15
 */
public class TextCategorizationTest {

	/**
	 * Expects the first parameter to point to the directory with the text
	 * files. In that directory, each sub-directory represents a class and the
	 * text 21 * files in these sub-directories will be labeled as such. 22 * 23
	 * * @param args the commandline arguments 24 * @throws Exception if
	 * something goes wrong 25
	 */
	public static void main(String[] args) throws Exception {
		// convert the directory into a dataset
		TextDirectoryLoader loader = new TextDirectoryLoader();
		loader.setDirectory(new File("./text_example"));
		Instances dataRaw = loader.getDataSet();
		System.out.println("\n\nImported data:\n\n" + dataRaw.numClasses());

		// apply the StringToWordVector
		// (see the source code of setOptions(String[]) method of the filter
		// if you want to know which command-line option corresponds to which
		// bean property)
		StringToWordVector filter = new StringToWordVector();
		filter.setInputFormat(dataRaw);
		Instances dataFiltered = Filter.useFilter(dataRaw, filter);
		System.out.println("\n\nFiltered data:\n\n" + dataFiltered);

		// train J48 and output model
		J48 classifier = new J48();
		classifier.buildClassifier(dataFiltered);
		System.out.println("\n\nClassifier model:\n\n" + classifier);
	}
}