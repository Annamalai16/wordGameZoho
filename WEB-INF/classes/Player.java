package wordGameBackend;

public class Player {
	
	private String userID;
	private int coins, userKey;
	
	Player(String userID, int coins, int userKey){
		this.userID = userID;
		this.coins = coins;
		this.userKey = userKey;
	}
	
	void reduceCoins() {
		this.coins-=20;
	}
	
	public int getCoins() {
		return this.coins;
	}
	
	public void setCoins(int temp) {
		this.coins+=temp;
	}
	
	public String getUserID() {
		return this.userID;
	}
	
	public int getUserKey() {
		return this.userKey;
	}

}