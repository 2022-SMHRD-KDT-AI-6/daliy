package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.EnrollDAO;
import Model.EnrollDTO;



@WebServlet("/EnrollController")
public class EnrollController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[EnrollController]");
		// 1. post방식 디코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. email, pw , tel, address 테이터 받아오기
		int r_cash = Integer.parseInt(request.getParameter("cash"));
		int c_limit =Integer.parseInt(request.getParameter("cardlimit"));
		int exp_limit =Integer.parseInt(request.getParameter("goal"));
		String id = request.getParameter("id");
		//		HttpSession session =  request.getSession();

//		String id = (String)session.getAttribute("user");
		
		
		
		//로그인한 사용자들이라면, userID에 값이 담기게될 것!
//		if(session.getAttribute("user") != null){
//			userID = (String) session.getAttribute("userID");
//		}
		System.out.println("보유현금 :" +r_cash );
		System.out.println("카드한도 :" +c_limit );
		System.out.println("소비한계 :" +exp_limit );
		System.out.println("id : " + id);
		
		
		// 3. DTO로 묶기
		EnrollDTO dto = new EnrollDTO(r_cash,c_limit,exp_limit,id);
		
		// 4. DAO에 있는 join메소드 호출
		EnrollDAO dao = new EnrollDAO();
		int row = dao.enroll(dto);
//		new MemberDAO().join(dto);
		String moveURL = null;
		if(row == 1) {
			System.out.println("데이터 저장성공");
			
			// request객체에 이메일 저장!
			request.setAttribute("user_id", id);
			
			moveURL = "./index.jsp";
		
		}else {
			System.out.println("테이터 저장실패");
			moveURL = "./index.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
	}

}
