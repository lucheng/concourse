/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import libsvm.svm;
import libsvm.svm_model;
import libsvm.svm_node;
import libsvm.svm_parameter;
import libsvm.svm_problem;

/**
 *
 * @author Administrator
 */
public class SVMService {
    

    private static svm_model model;

    public static svm_model getModel() {
        return model;
    }

    public static double predict(svm_node[]  nodes) {
        return svm.svm_predict(model, nodes);
    }

    public static void train(svm_problem problem, svm_parameter parameters) {

        model = svm.svm_train(problem, parameters);
    }
}
