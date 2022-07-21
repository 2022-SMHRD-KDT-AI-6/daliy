package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserDAO;
import Model.UserDTO;

@WebServlet("/joinSer")
public class joinSer extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[joinSer]");
		// 1. post방식 디코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. email, pw , tel, address 테이터 받아오기
		String id = request.getParameter("userID");
		String pw = request.getParameter("password");
		String name = request.getParameter("nickname");
		
		
		System.out.println("id :" +id );
		System.out.println("pw :" +pw );
		System.out.println("name :" +name );
		
		
		// 3. DTO로 묶기
		UserDTO dto = new UserDTO(id,pw,name);
		
		// 4. DAO에 있는 join메소드 호출
		UserDAO dao = new UserDAO();
		int row = dao.join(dto);
//		new MemberDAO().join(dto);
		String moveURL = null;
		if(row == 1) {
			System.out.println("회원가입 성공");
			
			// request객체에 이메일 저장!
			request.setAttribute("user_id", id);
			moveURL = "./index.jsp";
		
		}else {
			System.out.println("회원가입 실패");
			moveURL = "./index.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
	}

}

