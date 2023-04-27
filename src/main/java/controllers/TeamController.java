package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.Settings;
import dao.CreateTeamDAO;
import dto.TeamDTO;
import dto.HometownDTO;


@WebServlet("*.team")
public class TeamController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		
		

		try {	
			// 팀 생성 시 연고지 목록 가져오기
			if(cmd.equals("/hometown.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				List<HometownDTO> hometown_arr = dao.selectHometown();

				request.setAttribute("hometown_arr", hometown_arr);
				request.getRequestDispatcher("/team/team_write.jsp").forward(request, response);
			}
			// 팀명 중복도 검사
			else if(cmd.equals("/team_name_check.team")) {
				String team_name = request.getParameter("team_name");
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				boolean result = dao.team_nameExist(team_name);
				request.setAttribute("result", result);
				request.getRequestDispatcher("/team/team_name_checkview.jsp").forward(request, response);
			}
			// 팀생성 시 입력값 넘어오는 곳
			else if(cmd.equals("/create.team")) {
				String team_name = request.getParameter("team_name");
				String captain_name = request.getParameter("captain_name");
				String captain_phone = request.getParameter("captain_phone");
				int hometown_code = Integer.parseInt(request.getParameter("hometown_code"));
				String outline = request.getParameter("outline");
				String content = request.getParameter("content");
				TeamDTO dto = new TeamDTO(0, 1001, "logo", team_name, 10000001, hometown_code, outline, content, null, null, null);
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				dao.insertTeam(dto);
				response.sendRedirect("/list.team");
				
			}
			// 생성된 팀 목록 뽑아오기
			else if(cmd.equals("/list.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				request.getSession().setAttribute("updateCpage", currentPage);
				int start = (currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE) - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_NAVI_COUNT_PER_PAGE;
				
				List<TeamDTO> teamlist_arr = dao.selectTeam();
				String page_navi = dao.getPageNavi(currentPage);
				
				request.setAttribute("teamlist_arr", teamlist_arr);
				request.setAttribute("navi", page_navi);
				request.getRequestDispatcher("/team/team_list.jsp").forward(request, response); 
			}
//			else if(cmd.equals("/teampage.team")) {
//				
//			}
		}
		catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
