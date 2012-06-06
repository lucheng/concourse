package edu.bupt.nlp.textrank;

public class Word implements Comparable<Word>{
	
	public Word(){
		
	}
	
	public Word(int index, String word, String tagger){
		this.word = word;
		this.tagger = tagger;
		this.index = index;
	}

	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getTagger() {
		return tagger;
	}
	public void setTagger(String tagger) {
		this.tagger = tagger;
	}
	
	private String word;
	private String tagger;
	private int index;
	
	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	@Override
	public String toString() {
		
		return "["+this.word + "," + this.tagger+"]";
	}
	
	@Override
	public int compareTo(Word another) {
		
		return this.word.compareTo(another.getWord());
	}
}