/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package service;

import edu.udo.cs.wvtool.config.WVTConfiguration;
import edu.udo.cs.wvtool.config.WVTConfigurationFact;
import edu.udo.cs.wvtool.external.CHNWVTTokenizer;
import edu.udo.cs.wvtool.generic.stemmer.WVTStemmer;
import edu.udo.cs.wvtool.generic.output.WVTOutputFilter;
import edu.udo.cs.wvtool.generic.stemmer.DictionaryStemmer;
import edu.udo.cs.wvtool.generic.stemmer.DummyStemmer;
import edu.udo.cs.wvtool.generic.vectorcreation.BinaryOccurrences;
import edu.udo.cs.wvtool.generic.vectorcreation.TFIDF;
import edu.udo.cs.wvtool.generic.vectorcreation.TermFrequency;
import edu.udo.cs.wvtool.generic.vectorcreation.TermOccurrences;
import edu.udo.cs.wvtool.generic.vectorcreation.WVTVectorCreator;
import edu.udo.cs.wvtool.generic.wordfilter.DummyWordFilter;
import edu.udo.cs.wvtool.main.WVTDocumentInfo;
import edu.udo.cs.wvtool.main.WVTFileInputList;
import edu.udo.cs.wvtool.main.WVTWordVector;
import edu.udo.cs.wvtool.main.WVTool;
import edu.udo.cs.wvtool.util.WVToolException;
import edu.udo.cs.wvtool.wordlist.WVTWordList;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import libsvm.svm_node;
import libsvm.svm_problem;

/**
 *
 * @author Administrator
 */
public class VSMService {

    private static VSMService _instance;
    private HashMap<String, Object> _config;
    private WVTConfiguration _wvtConfig;
    private WVTFileInputList _inputList;
    private WVTool _wvtool;
    private LIBSVMWordVectorWriter _outputFilter;
    private WVTWordList _wordList;

    private void createWordListAndVSM() {
        try {
            _wordList = _wvtool.createWordList(_inputList, _wvtConfig);
            _wordList.pruneByFrequency((Integer)_config.get("DF_MIN"), (Integer)_config.get("DF_MAX"));
            _wvtool.createVectors(_inputList, _wvtConfig, _wordList);
        } catch (WVToolException ex) {
            Logger.getLogger(VSMService.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    class LIBSVMWordVectorWriter implements WVTOutputFilter {
        private List<Integer> types;
        private List<svm_node[]> values;
        private svm_problem problem;
        public LIBSVMWordVectorWriter() {
           types = new LinkedList<Integer>();
           values = new LinkedList<svm_node[]>();
        }

        public void write(WVTWordVector vector) throws WVToolException {
            types.add(vector.getDocumentInfo().getClassValue());
            double[] value = vector.getValues();
            int length = 0;
            for(double v : value) {
                if(v != 0.0) length++;
            }
            svm_node[] nodes = new svm_node[length];
            for(int i=0, j=0; i<value.length; i++) {
                if(value[i] != 0.0) {
                    svm_node node = new svm_node();
                    node.index = i;
                    node.value = value[i];
                    nodes[j++] = node;
                }
            }
            value = null;
            values.add(nodes);
        }

        public svm_problem getSVMProblem() {
            if(problem != null) return problem;
            problem = new svm_problem();
            problem.l = types.size();
            double[] y = new double[problem.l];
            for(int i=0; i<problem.l; i++) {
                y[i] = types.get(0);
                types.remove(0);
            }
            problem.y = y;
            this.types = null;

            svm_node[][] x = new svm_node[problem.l][];
            for(int i=0; i<problem.l; i++) {
                x[i] = values.get(0);
                values.remove(0);
            }
            problem.x = x;
            this.values = null;
            return problem;
        }
    }

    protected VSMService(HashMap<String, Object> config) {
        this._config = config;
        initWVTFileInputList();
        initWVTConfig();
        initWVTool();
        createWordListAndVSM();
    }

    //单体模式
    public static void build(HashMap<String, Object> config) {
        _instance = new VSMService(config);
    }
    
    //单体模式
    public static VSMService getInstance() {
        return _instance;
    }

    public svm_problem getVSM() {
       return _outputFilter.getSVMProblem();
    }

    public svm_node[] getVSM(String doc) {
        WVTWordVector vector = null;
        try {
            WVTDocumentInfo info = new WVTDocumentInfo("", "", "", "");
            vector = _wvtool.createVector(doc, info, _wvtConfig, _wordList);
        } catch (WVToolException ex) {
            Logger.getLogger(VSMService.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        svm_node[] nodes = new svm_node[vector.getValues().length];
        for(int i=0; i<nodes.length; i++) {
            nodes[i] = new svm_node();
            nodes[i].index = i;
            nodes[i].value = vector.getValues()[i];
        }

        return nodes;
    }

    public int getDictionarySize() {
        return this._wordList.getNumWords();
    }

    private void initWVTConfig() {
        _wvtConfig = new WVTConfiguration();

        DummyWordFilter wordFilter = new DummyWordFilter();
        wordFilter.setMinNumChars(2);

        WVTStemmer stemmer = null;
        String THERSAUS = (String)_config.get("THERSAUS");

        if(THERSAUS.length() != 0) {
            try {
                stemmer = new DictionaryStemmer(new FileReader(new File(THERSAUS)));
            } catch (FileNotFoundException e) {

            } catch (IOException e) {

            } 
        } else {

            stemmer = new DummyStemmer();
        }
        
        _outputFilter = new LIBSVMWordVectorWriter();
        
        WVTVectorCreator vectorCreator = null;
        String type = (String)this._config.get("WEIGHT");
        
        if(type.equals("TFIDF")) {
            vectorCreator = new TFIDF();
        } else if(type.equals("TF")) {
            vectorCreator = new TermFrequency();
        } else if(type.equals("TermOccurrences")) {
            vectorCreator = new TermOccurrences();
        } else if(type.equals("BinaryOccurrences")) {
            vectorCreator = new BinaryOccurrences();
        }
      
        _wvtConfig.setConfigurationRule(WVTConfiguration.STEP_WORDFILTER, new WVTConfigurationFact(wordFilter));
        _wvtConfig.setConfigurationRule(WVTConfiguration.STEP_TOKENIZER, new WVTConfigurationFact(new CHNWVTTokenizer()));
        _wvtConfig.setConfigurationRule(WVTConfiguration.STEP_STEMMER, new WVTConfigurationFact(stemmer));
        _wvtConfig.setConfigurationRule(WVTConfiguration.STEP_OUTPUT, new WVTConfigurationFact(_outputFilter));
        _wvtConfig.setConfigurationRule(WVTConfiguration.STEP_VECTOR_CREATION, new WVTConfigurationFact(vectorCreator));

    }

    private void initWVTFileInputList() {
        File corpus = new File((String)this._config.get("CORPUS"));
        String[] cDirs = corpus.list();
        _inputList = new WVTFileInputList(cDirs.length);
        for(int i=0; i<cDirs.length; i++) {
            _inputList.addEntry(new WVTDocumentInfo((String)this._config.get("CORPUS") + "/" + cDirs[i], "", "UTF-8", "", i));
        }
    }

    private void initWVTool() {
       _wvtool = new WVTool(false);
    }
}
