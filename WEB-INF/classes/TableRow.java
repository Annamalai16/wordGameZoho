package wordGameBackend;

public class TableRow {
	private int score, attempts, clue;
	private String level, word;
	
	TableRow(String level, String word, int score, int attempts, int clue){
		this.score = score;
		this.attempts = attempts;
		this.clue = clue;
		this.level = level;
		this.word = word;
	}
	
	public int getScore() {
		return this.score;
	}
	
	public int getAttempts() {
		return this.attempts;
	}
	
	public int getClue() {
		return this.clue;
	}
	
	public String getLevel() {
		return this.level;
	}
	
	public String getWord() {
		return this.word;
	}

}
