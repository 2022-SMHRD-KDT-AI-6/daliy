package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ChartDTO;
import Model.UserDTO;
import Model.t_expenseDAO;
import Model.t_expenseDTO;

@WebServlet("/DayListService")
public class DayListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("listservice in");	
		
		t_expenseDAO dao1 = new t_expenseDAO();
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		ArrayList<ChartDTO> list = dao1.bringDayPrice(dto.getId());
		
		if (list != null) {
			request.setAttribute("list", list);
			//System.out.println(list.get(0).getUser_id());
			for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(0).getCate());
			System.out.println(list.get(0).getSum());
			}
			System.out.println("listservice out");
		}
		RequestDispatcher rd = request.getRequestDispatcher("ChartsDay.jsp");
		rd.forward(request, response);
	}

}
