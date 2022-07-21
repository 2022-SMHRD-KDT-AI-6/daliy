package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class DAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	DTO dto = null;
	
	
	
	// DB 연결 메소드
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
	}//db_conn 끝
	
	// DB 종료 메소드
	public void db_close() {
		
			try {
				if(rs != null) rs.close();
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	} //db_close 끝


	// 날짜와 날짜별 총 합 얻어오기 7월
    public ArrayList<DTO> getPrices(String id){
		
    	UserDTO dto1 = new UserDTO();
        ArrayList<DTO> list = new ArrayList<DTO>();
                
        db_conn();
        
        try {
            // user_id=? 수정해야 함
            String sql = "";
            sql += "select  TO_CHAR(exp_date, 'yyyy-mm-dd') as day, sum(exp_price) from T_EXPENSE ";
            sql += " where user_id=?";
            sql += " group by TO_CHAR(exp_date, 'yyyy-mm-dd')";
            sql += " order by day";
            
            
            psmt = conn.prepareStatement(sql);
            
            
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            
            while(rs.next()) {
                 
                // day
                String day = rs.getString(1);
                //String cate = rs.getString(2);
                int sum = rs.getInt(2);
                
                dto = new DTO();
                dto.setDay(day);
                dto.setSum(sum);
               
                
                list.add(dto);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            db_close();
        }
        return list;
    } // 7일 getPrices끝	
	
}
