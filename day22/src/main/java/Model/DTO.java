package Model;


//import Model.UserDTO;
public class DTO {

	String day;
	String user_id;
	int sum;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public DTO(String day, String user_id, int sum) {
		this.day = day;
		this.user_id = user_id;
		this.sum = sum;
	}
	public DTO() {}

/*public DTO() {}

	@Override
	public String toString() {
		return "날짜 : " + this.sum + "\n"; 
	}*/
	
}
