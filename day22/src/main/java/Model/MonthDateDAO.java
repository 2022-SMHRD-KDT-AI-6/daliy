package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MonthDateDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	t_expenseDTO dto = null;
	UserDTO dto1 = new UserDTO();
	
	// DB ���� �޼ҵ�
	public void db_conn() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_user = "cgi_8_0704_4";
			String db_pw = "smhrd4";
			
			conn = DriverManager.getConnection(url, db_user, db_pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//db_conn ��
	
	// DB ���� �޼ҵ�
	public void db_close() {
		
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}//db_close ��


	//1��
	public ArrayList<t_expenseDTO> jan(String id) {
		
		ArrayList<t_expenseDTO> list1 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {//user_id=? �����ؾ� ��.
			String sql = "select * from t_expense where user_id= ? and exp_date\r\n"
					+ "between '2022/01/01' and '2022/01/31'";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list1.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list1;
	}//jan ��	
	
	
	//2��
	public ArrayList<t_expenseDTO> feb(String id) {
		
		ArrayList<t_expenseDTO> list2 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/02/01' and '2022/02/28'";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list2.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list2;
	}//feb ��	
	

	//3��
	public ArrayList<t_expenseDTO> mar(String id) {
		
		ArrayList<t_expenseDTO> list3 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/03/01' and '2022/03/31'";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list3.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list3;
	}//mar ��	
	
	
	//4��
	public ArrayList<t_expenseDTO> apr(String id) {
		
		ArrayList<t_expenseDTO> list4 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/04/01' and '2022/04/30'";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list4.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list4;
	}//apr ��	
	
	
	
		//5��
			public ArrayList<t_expenseDTO> may(String id) {
				
				ArrayList<t_expenseDTO> list5 = new ArrayList<t_expenseDTO>();
				db_conn();
				
				try {
					String sql = "select * from t_expense where user_id=? and exp_date\r\n"
							+ "between '2022/05/01' and '2022/05/31'";
					
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						int price = rs.getInt("exp_price");
						
						dto = new t_expenseDTO();
						dto.setExp_price(price);
						
						list5.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db_close();
				}
				return list5;
			}//may ��
	
	
	//6��
		public ArrayList<t_expenseDTO> jun(String id) {
			
			ArrayList<t_expenseDTO> list6 = new ArrayList<t_expenseDTO>();
			db_conn();
			
			try {
				String sql = "select * from t_expense where user_id=? and exp_date\r\n"
						+ "between '2022/06/01' and '2022/06/30'";
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					int price = rs.getInt("exp_price");
					
					dto = new t_expenseDTO();
					dto.setExp_price(price);
					
					list6.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db_close();
			}
			return list6;
		}//jun ��
	
	
	//7��
	public ArrayList<t_expenseDTO> jul(String id) {
		
		ArrayList<t_expenseDTO> list7 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/07/01' and '2022/07/31'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list7.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list7;
	}//jul ��

	
	//8��
	public ArrayList<t_expenseDTO> aug(String id) {
		
		ArrayList<t_expenseDTO> list8 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/08/01' and '2022/08/31'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list8.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list8;
	}//aug ��
	
	
	//9��
	public ArrayList<t_expenseDTO> sep(String id) {
		
		ArrayList<t_expenseDTO> list9 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/09/01' and '2022/09/30'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list9.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list9;
	}//sep ��	
	
	
	//10��
	public ArrayList<t_expenseDTO> oct(String id) {
		
		ArrayList<t_expenseDTO> list10 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/10/01' and '2022/10/31'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list10.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list10;
	}//oct ��
	
	
	//11��
	public ArrayList<t_expenseDTO> nov(String id) {
		
		ArrayList<t_expenseDTO> list11 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/11/01' and '2022/11/30'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list11.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list11;
	}//nov ��
	
	
	//12��
	public ArrayList<t_expenseDTO> dec(String id) {
		
		ArrayList<t_expenseDTO> list12 = new ArrayList<t_expenseDTO>();
		db_conn();
		
		try {
			String sql = "select * from t_expense where user_id=? and exp_date\r\n"
					+ "between '2022/12/01' and '2022/12/31'";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt("exp_price");
				
				dto = new t_expenseDTO();
				dto.setExp_price(price);
				
				list12.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list12;
	}//nov ��	
	
	
	
}
