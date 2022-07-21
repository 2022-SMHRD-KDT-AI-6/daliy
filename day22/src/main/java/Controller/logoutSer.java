package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutSer")
public class logoutSer extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그아웃??? -> 세션에 유지시키고 있는 사용자정보 삭제
		// 섹션 객체 생성
		// ctrl + shift + o
		HttpSession session = request.getSession();
		// 1. 한개만 삭제
		session.removeAttribute("user");
		// 2. 세션을 통채로 삭제
//		session.invalidate();
		
		// 메인페이지로 돌아가기
		response.sendRedirect("./index.jsp");
	}

}

