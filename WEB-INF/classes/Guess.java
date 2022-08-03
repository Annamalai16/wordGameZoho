package wordGameBackend;

import java.util.ArrayList;
import java.util.HashMap;

public class Guess{

   private HashMap<Integer,Character> guessLetter = new HashMap<>();
   ArrayList<Character> wrongPos = new ArrayList<>();
    
    void setLetters(HashMap<Integer, Character> guessLetters){
    	this.guessLetter = guessLetters;
    }
    
	void AddWrongPosition(char ch) {
    	if(wrongPos.contains(new Character(ch))==false) {
    		this.wrongPos.add(ch);
    	}
    }
    
    public HashMap<Integer,Character> getLetters(){
    	return this.guessLetter;
    }
    
    public ArrayList<Character> getWrongPos(){
    	return wrongPos;
    }
    
    void removeWrongPosition(char ch) {
    	for(int ind=0;ind<this.wrongPos.size();ind++) {
    		if(this.wrongPos.get(ind)==ch) {
    			wrongPos.remove(ind);
    			break;
    		}
    	}
    }
}