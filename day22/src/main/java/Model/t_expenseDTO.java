package Model;

public class t_expenseDTO {

	private int exp_seq;
	private String exp_item;
	private int exp_price ;
	private String exp_shop;
	private String exp_category;
	private char exp_methode;
	private String exp_date;
	private String user_id;
	
	

	// 기본 생성자
	public t_expenseDTO() {
		super();
	}


	// 가격, 카테고리, 아이디 매개 변수 생성자
	public t_expenseDTO(int exp_price, String exp_category, String user_id) {
		super();
		this.exp_price = exp_price;
		this.exp_category = exp_category;
		this.user_id = user_id;
	}
	
	// 가격, 카테고리, 날짜, 아이디 매개 변수 생성자
	public t_expenseDTO(int exp_price, String exp_category, String exp_date, String user_id) {
		super();
		this.exp_price = exp_price;
		this.exp_category = exp_category;
		this.exp_date = exp_date;
		this.user_id = user_id;
	}




	
	// getter & setter
	public int getExp_seq() {
		return exp_seq;
	}


	public void setExp_seq(int exp_seq) {
		this.exp_seq = exp_seq;
	}


	public String getExp_item() {
		return exp_item;
	}


	public void setExp_item(String exp_item) {
		this.exp_item = exp_item;
	}


	public int getExp_price() {
		return exp_price;
	}


	public void setExp_price(int exp_price) {
		this.exp_price = exp_price;
	}


	public String getExp_shop() {
		return exp_shop;
	}


	public void setExp_shop(String exp_shop) {
		this.exp_shop = exp_shop;
	}


	public String getExp_category() {
		return exp_category;
	}


	public void setExp_category(String exp_category) {
		this.exp_category = exp_category;
	}


	public char getExp_methode() {
		return exp_methode;
	}


	public void setExp_methode(char exp_methode) {
		this.exp_methode = exp_methode;
	}


	public String getExp_date() {
		return exp_date;
	}


	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
