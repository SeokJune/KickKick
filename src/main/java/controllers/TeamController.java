package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.Settings;
import dao.CreateTeamDAO;
import dto.HometownDTO;
import dto.TeamDTO;


@WebServlet("*.team")
public class TeamController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		
		Gson g = new Gson();

		try {	
			// 팀 생성 시 연고지 목록 가져오기
			if(cmd.equals("/hometown.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				List<HometownDTO> hometown_arr = dao.select_hometown();

				request.setAttribute("hometown_arr", hometown_arr);
				request.getRequestDispatcher("/team/team_write.jsp").forward(request, response);
			}
			// 팀명 중복도 검사
			else if(cmd.equals("/team_name_check.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				String team_name = request.getParameter("team_name");
				boolean result = dao.team_name_exist(team_name);
				String resp = g.toJson(result);
				response.getWriter().append(resp);

			}
			// 팀생성 시 입력값 넘어오는 곳
			else if(cmd.equals("/create.team")) {
				String real_path = request.getServletContext().getRealPath("image/team_img/");
				System.out.println(real_path);
				File realPathFile = new File(real_path);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request, real_path, 1024*1024*50, "utf8", new DefaultFileRenamePolicy());
				  
				
				
				
//				String oriname = multi.getOriginalFileName("file");
				String sysname = multi.getFilesystemName("file");
				
				String team_name = multi.getParameter("team_name");
				String captain_name = multi.getParameter("captain_name");
				String captain_phone = multi.getParameter("captain_phone");
				int hometown_code = Integer.parseInt(multi.getParameter("hometown_code"));
				String outline = multi.getParameter("outline");
				String content = multi.getParameter("content");
				
				File target = new File(real_path + "\\" + sysname);
				target.renameTo(new File(real_path + "\\" + team_name + ".png"));
				
				
				
				CreateTeamDAO dao = CreateTeamDAO.getInstance();				
				TeamDTO teamdto = new TeamDTO(0, Settings.LOGO_PATH_CODE, team_name+".png", team_name, 10000001, hometown_code, outline, content, null, null, null);
				dao.insert_team(teamdto);
				
				response.sendRedirect("/list.team?cpage=1"); 
				
			}
			// 생성된 팀 목록 뽑아오기
			else if(cmd.equals("/list.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				
				int current_page = request.getParameter("cpage")==null?1 : Integer.parseInt(request.getParameter("cpage"));
				request.getSession().setAttribute("update_cpage", current_page);
				int start = (current_page * Settings.BOARD_RECORD_COUNT_PER_PAGE) - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = current_page * Settings.BOARD_NAVI_COUNT_PER_PAGE;
				
				List<TeamDTO> teamlist_arr = dao.select_team(start, end);
				String page_navi = dao.get_page_navi(current_page);
				request.setAttribute("teamlist_arr", teamlist_arr);
				request.setAttribute("navi", page_navi);
				request.getRequestDispatcher("/team/team_list.jsp").forward(request, response); 
			}
			else if(cmd.equals("/view.team")) {
				int team_code = Integer.parseInt(request.getParameter("team_code"));
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				TeamDTO team_info = dao.team_info(team_code);
				request.setAttribute("team_info", team_info);
				request.getRequestDispatcher("/team/team_view.jsp").forward(request, response); 
			}
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
