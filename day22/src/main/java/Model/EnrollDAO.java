package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EnrollDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	
	// DB연결 메소드
	public void db_conn() {

		try {
		// 1. pom.xml 에 ojdbc6.jar 라이브러리 추가
		// 2. java와 DB를 연결해줄 통로 -> OracleDriver 클래스
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		// 3. 카드키 설정 
		// 추후 변경
		String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
		String db_user = "cgi_8_0704_4";
		String db_pw = "smhrd4";
		
		// 4. DB에 접속 -> 성공시 Connection객체로 반환
		conn = DriverManager.getConnection(url, db_user, db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// DB종료 메소드
	public void db_close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 자산등록 메소드
	public int enroll(EnrollDTO dto) {
		db_conn(); // DB연결 메소드 호출
		int row = 0;
		try {
			// SQL문 작성
			String sql = "insert into T_ASSETS(r_cash,c_limit,exp_limit,user_id) values(?, ?, ?,?)";
			// SQL문 DB에 전달 -> 성공 시 prepareStatement 객체 반환
			psmt = conn.prepareStatement(sql);
			
			// ? 에 값 채우기
			psmt.setInt(1, dto.getR_cash());
			psmt.setInt(2, dto.getC_limit());
			psmt.setInt(3, dto.getExp_limit());
			psmt.setString(4, dto.getUser_id());

			
			// SQL문 실행
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return row;
	}
}
