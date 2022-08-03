package wordGameBackend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Set;

public class WordHandler{

    private String actualWord,level;
    private StringBuffer guessedWord,toFindLetters;
    private int score, attempts,clueCount,clueInd;

    public WordHandler(String word,String level) throws ClassNotFoundException, IOException, SQLException{

        this.actualWord = word.toUpperCase();
        this.guessedWord = new StringBuffer(word.length());
        this.toFindLetters = new StringBuffer(this.actualWord);
        this.score = 0;
        this.attempts = 0;
        this.clueCount = 0;
        this.level = level;
        for(int ind=0; ind<actualWord.length(); ind++){
            guessedWord.append('_');
        }
    }

    void guessChecker(Guess guess){

        HashMap<Integer, Character> letters = guess.getLetters();
        Set<Integer> keys = letters.keySet();
        
        for(int key: keys){
        	
        	int pos = key;
        	char letter = Character.toUpperCase(letters.get(key));
        	
	        if(this.actualWord.charAt(pos) == letter){
	            guessedWord.setCharAt(pos, letter);
	            toFindLetters.setCharAt(pos, '_');
	            guess.removeWrongPosition(letter);
	            this.score+=10;
	        }
        }
        
        for(int key: keys){
        	int pos = key;
        	char letter = Character.toUpperCase(letters.get(key));
        	
	        if(this.guessedWord.charAt(pos)=='_') {
	        	if(toFindLetters.toString().contains(Character.toString(letter))) {
	        		guess.AddWrongPosition(letter);	
	        		this.score-=1;
	        	}
	        	else {
	        		this.score-=2;
	        	}
	        }
        }
        
        if(this.score<0) {
        	this.score = 0;
        }
        
        this.attempts++;
        if(actualWord.equals(guessedWord.toString())) {
        	this.score = (int)((this.score*1.0/(this.guessedWord.length()*10.0))*100);
        }
    }
    
    void clue(Guess guess) {
    	for(int ind=0;ind<this.actualWord.length();ind++) {
    		if(guessedWord.charAt(ind)=='_') {
    			guessedWord.setCharAt(ind,actualWord.charAt(ind));
    			this.clueCount++;
    	    	this.clueInd = ind;
    	    	guess.removeWrongPosition(actualWord.charAt(ind));
    	    	break;
    		}
    	}
    }
    
    public int getScore(){
        return this.score;
    }

    public int getAttempts(){
        return this.attempts;
    }

    public String getActualWord(){
        return this.actualWord;
    }
    
    public String getGuessedWord(){
        return this.guessedWord.toString();
    }
    
    public int getClueCount() {
    	return this.clueCount;
    }
    
    public String getLevel() {
    	return this.level;
    }  
    
    public int getClueInd() {
    	return this.clueInd;
    }
    
    public String getToFindLetters() {
    	return this.toFindLetters.toString();
    }
}