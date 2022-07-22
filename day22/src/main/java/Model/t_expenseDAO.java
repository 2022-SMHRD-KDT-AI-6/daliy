package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.ChartDTO;

public class t_expenseDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	t_expenseDTO dto = null;
	ChartDTO dto1 = null;
	

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
	
	
	// �Ϸ� ���� �������� �޼ҵ�
	public ArrayList<ChartDTO> bringDayPrice(String id) {
		
		ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
		
		db_conn();
		
		try {// sqp�� ���� ����(user_id=? ��)
			String sql = "select sum(exp_price), exp_category from t_expense where user_id=? and trim(exp_date)=to_char(sysdate) group by exp_category";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int price = rs.getInt(1);
				String category = rs.getString(2);
				//String user_id = rs.getString("user_id");
				
				dto1 = new ChartDTO();
				dto1.setSum(price);
				dto1.setCate(category);
				
				list.add(dto1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db_close();
		}
		return list;
		
	}// bringDayPrice ��
	
	
	
	// �ֺ� ���� ������ �������� �޼ҵ� 
	// ��������
		public ArrayList<ChartDTO> getPrices(String id){
			
			ArrayList<ChartDTO> list = new ArrayList<ChartDTO>();
					
			db_conn();
			
			try {
				// user_id=? �����ؾ� ��
				String sql = "";
				sql += "select  TO_CHAR(exp_date, 'yyyy-mm-dd') as day, exp_category, sum(exp_price) from T_EXPENSE ";
				sql += " where exp_date between sysdate-7 and sysdate and user_id=?";
				sql += " group by TO_CHAR(exp_date, 'yyyy-mm-dd'), exp_category";
				sql += " order by day";
				
				psmt = conn.prepareStatement(sql);
				
			    psmt.setString(1, id);
				
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					
					// day
					String day = rs.getString(1);
					String cate = rs.getString(2);
					int sum = rs.getInt(3);
					
					list.add(new ChartDTO(day, cate, sum));
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				db_close();
			}
			
			
			
			return list;
		} // 7�� getPrices��
	
	

	
	

	
	
}
