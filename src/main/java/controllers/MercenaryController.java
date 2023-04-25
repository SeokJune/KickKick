package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MercenaryDAO;
import dto.TeamInfoDTO;

@WebServlet("*.mercenary")
public class MercenaryController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		
		try {
			if(cmd.equals("/toRegisterForm.mercenary")) {
				List<TeamInfoDTO> teamList = MercenaryDAO.getInstance().selectTeamInfo();
				
				request.setAttribute("teamList", teamList);
				response.sendRedirect("/mercenary/register_form.jsp");
				
			}else if(cmd.equals("/toRegisterList.mercenary")) {
				response.sendRedirect("/mercenary/register_list.jsp");
			}else if(cmd.equals("/toApplyForm.mercenary")) {
				response.sendRedirect("/mercenary/apply_form.jsp");
			}else if(cmd.equals("/toApplyList.mercenary")) {
				response.sendRedirect("/mercenary/apply_list.jsp");
			}else if(cmd.equals("/teamCheck.mercenary")) {
				//  세션에서 로그인 아이디 받아올 수 있도록 수정
				String loginID = "agji";
				List<TeamInfoDTO> teamSelectList = MercenaryDAO.getInstance().teamSelectById(loginID);
				
				request.getSession().setAttribute("loginID", loginID);
				request.setAttribute("teamSelectList", teamSelectList);
				request.getRequestDispatcher("/mercenary/team_check_view.jsp").forward(request, response);
				
			}else if(cmd.equals("/matchCheck.mercenary")) {
				
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
