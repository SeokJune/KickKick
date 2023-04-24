package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MercenaryDAO;
import dto.TeamCheckDTO;
import dto.TeamInfoDTO;

@WebServlet("*.mercenary")
public class MercenaryController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/toRegisterForm.mercenary")) {
				response.sendRedirect("/mercenary/mercenaryRegisterForm.jsp");
				
			}else if(cmd.equals("/toRegisterFormWithInfo.mercenary")) {
				int search_team_code = Integer.parseInt(request.getParameter("team_code"));
				
				TeamInfoDTO teamInfodto = MercenaryDAO.getInstance().selectTeamInfo(search_team_code);

				request.setAttribute("teamInfodto", teamInfodto);
				response.sendRedirect("/mercenary/mercenaryRegisterForm.jsp");
				
			}else if(cmd.equals("/toRegisterList.mercenary")) {
				response.sendRedirect("/mercenary/mercenaryRegisterList.jsp");
			}else if(cmd.equals("/toApplyForm.mercenary")) {
				response.sendRedirect("/mercenary/mercenaryApplyForm.jsp");
			}else if(cmd.equals("/toApplyList.mercenary")) {
				response.sendRedirect("/mercenary/mercenaryApplyList.jsp");
			}else if(cmd.equals("/teamCheck.mercenary")) {
				String loginID = "agji";
				List<TeamCheckDTO> teamList = MercenaryDAO.getInstance().teamSelect(loginID);
				
				request.getSession().setAttribute("loginID", loginID);
				request.setAttribute("teamList", teamList);
				request.getRequestDispatcher("/mercenary/teamCheckView.jsp").forward(request, response);
			}
				
			
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
