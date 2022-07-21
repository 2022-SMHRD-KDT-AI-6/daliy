package Model;

public class EnrollDTO {
	private int r_cash;
	private int c_limit;
	private int exp_limit;
	public EnrollDTO(int r_cash, int c_limit, int exp_limit, String user_id) {

		this.r_cash = r_cash;
		this.c_limit = c_limit;
		this.exp_limit = exp_limit;
		this.user_id = user_id;
	}
	public EnrollDTO() {}
	private String user_id;
	public int getR_cash() {
		return r_cash;
	}
	public void setR_cash(int r_cash) {
		this.r_cash = r_cash;
	}
	public int getC_limit() {
		return c_limit;
	}
	public void setC_limit(int c_limit) {
		this.c_limit = c_limit;
	}
	public int getExp_limit() {
		return exp_limit;
	}
	public void setExp_limit(int exp_limit) {
		this.exp_limit = exp_limit;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
