package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserDAO;
import Model.UserDTO;


@WebServlet("/loginSer")
public class loginSer extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. post방식 디코딩
		request.setCharacterEncoding("UTF-8");
		// 파라미터 수집 : 데이터 꺼내서, 변수 담기(DTO로 묶기)
		String id = request.getParameter("userID");
		String pw = request.getParameter("password");
		
		System.out.println("id :" +id );
		System.out.println("pw :" +pw );
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(dto.getName());
		
		UserDAO dao = new UserDAO();
		dto = dao.login(dto);
		
		
		// 3. 성공 or 실패 판단
		// 성공 : dto --> email, pw, tel, address 다 들어있는 MemberDTO
		// 실패 : dto --> null

		if(dto != null) {
			System.out.println("로그인 성공");
			// 세션에 사용자 정보 저장
			
			// 세선 객체 생성
			HttpSession session = request.getSession();
			// 세션에 데이터 저장
			session.setAttribute("user",dto);
			response.sendRedirect("./index.jsp");
		}else {
			System.out.println("로그인 실패");	
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('다시 로그인해주세요.')");
			script.println("history.back()"); 
			script.println("</script>");	
			
		}
		
	}	
	

}