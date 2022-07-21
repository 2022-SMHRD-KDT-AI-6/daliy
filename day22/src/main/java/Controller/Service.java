package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.DAO;
import Model.DTO;
import Model.UserDTO;

@WebServlet("/Service")
public class Service extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("Service in");
		
		DAO dao = new DAO();
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		ArrayList<DTO> list = dao.getPrices(dto.getId());
		
		if(list != null) {
			request.setAttribute("list", list);
			for(int i = 0; i < list.size(); i++){
			System.out.println(list.get(i).getDay());
			System.out.println(list.get(i).getSum());
			}
		}
		System.out.println("Service out");
		RequestDispatcher rd = request.getRequestDispatcher("Calendar.jsp");
		rd.forward(request, response);
		
		/*Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json);*/
		
	
	
	
	}

}
