package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
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
	// 회원가입 메소드
	public int join(UserDTO dto) {
		db_conn(); // DB연결 메소드 호출
		int row = 0;
		String a = "a";
		try {
			// SQL문 작성
			String sql = "insert into t_user values(?, ?, ?,sysdate,?)";
			
			// SQL문 DB에 전달 -> 성공 시 prepareStatement 객체 반환
			psmt = conn.prepareStatement(sql);
			
			// ? 에 값 채우기
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, a);
			
			// SQL문 실행
			row = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			db_close();
		}
		return row;
	}
	
	// 로그인 메소드
	public UserDTO login(UserDTO dto) {
		// DB연결
		db_conn();
		try {
			String sql = "select * from t_user where user_id =? and user_pw =?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			// executeUpdate() => 몇행 성공했는지(int)
			// executeQuery() => 실제 조회 결과(ResultSet)
			rs = psmt.executeQuery();
			// select의 경우, 실행결과 처리
			// rs --> dto
			if(rs.next()) {
				// rs -->dto
			String id = rs.getString("user_id");
			String name = rs.getString("user_name");
			
			// 방법 1.
			//MemberDTO rdto = new MemberDTO();
			//rdto.setEmail(email);
			
			
			// 방법 2.
			// select 결과 있음 == 로그인 성공
			// 사용자가 입력한 email,pw 정확함
//			dto.setTel(tel);
//			dto.setAddress(address);
			}else {
				dto = null;
			}
		}catch (Exception e) {
			// runtime error 이름, 코드위치를 console출력
			e.printStackTrace();
		}finally {
			db_close();
		}return dto;
	}
//	public int update(MemberDTO udto) {
//		db_conn();
//		int cnt = 0;
//		try {
//			String sql = "update web_member set pw = ?, tel = ?, address = ? where email = ? ";
//			psmt = conn.prepareStatement(sql);
//			
//			psmt.setString(1, udto.getPw());
//			psmt.setString(2, udto.getTel());
//			psmt.setString(3, udto.getAddress());
//			psmt.setString(4, udto.getEmail());
//			
//			
//			cnt = psmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			db_close();
//		}return cnt;
//	}
	
}