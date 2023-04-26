package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CreateTeamDAO;
import dto.CreateTeamDTO;
import dto.HometownDTO;


@WebServlet("*.team")
public class TeamController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();

		try {	
			if(cmd.equals("/hometown.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				List<HometownDTO> arr = dao.select();

				request.setAttribute("arr", arr);
				request.getRequestDispatcher("/team/team_write.jsp").forward(request, response);
			}
			else if(cmd.equals("/create.team")) {
				String team_name = request.getParameter("team_name");
				String captain_name = request.getParameter("captain_name");
				String captain_phone = request.getParameter("captain_phone");
				int hometown_code = Integer.parseInt(request.getParameter("hometown_code"));
				String outline = request.getParameter("outline");
				String content = request.getParameter("content");
				CreateTeamDTO dto = new CreateTeamDTO(0, 0, "logo", team_name, 0, hometown_code, outline, content, null, null, null);
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				dao.insertTeam(dto);
//				System.out.println("메롱1");
				response.sendRedirect("/list.team");
//				System.out.println("메롱2");

				
			}
			else if(cmd.equals("/list.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				List<CreateTeamDTO> arr = dao.selectTeam();
				request.setAttribute("arr", arr);
				request.getRequestDispatcher("/team/team_list.jsp").forward(request, response);
			}
//			else if(cmd.equals("/teampage.team")) {
//				
//			}
		}
		catch(Exception e) {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
