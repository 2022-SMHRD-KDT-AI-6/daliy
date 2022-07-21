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

import Model.t_expenseDAO;
import Model.t_expenseDTO;
import Model.ChartDTO;
import Model.UserDTO;


@WebServlet("/WeekListService")
public class WeekListService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// DB���� ������ ���� ��������
		t_expenseDAO dao = new t_expenseDAO();
		HttpSession session = request.getSession();
		UserDTO dto = (UserDTO)session.getAttribute("user");
		
		ArrayList<ChartDTO> list = dao.getPrices(dto.getId());
		
		// ArrayList >> json��ü
		// gson: json �����͸� java object�� �����ϴ� ���̺귯��
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json);
		
		
		
		
		
		/*ArrayList<t_expenseDTO> WList = dao.bringWeekPrice();
		
		//for(int i = 0; i < WList.size(); i++) {
		//	System.out.println(WList.get(i).getExp_date().substring(0,10) + WList.get(i).getExp_date().substring(11,13) + ":" + WList.get(i).getExp_date().substring(14,16));
			//WList.get(0).getExp_date();
		}
		
		
		request.setAttribute("WList", WList);
		
		RequestDispatcher rd = request.getRequestDispatcher("ChartsWeek.jsp");
		rd.forward(request, response);*/
		
		
		
	}

}
