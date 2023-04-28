package controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
				String realPath = request.getServletContext().getRealPath("image/team_img");
				System.out.println(realPath);
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request, realPath, 1024*1024*50, "utf8", new DefaultFileRenamePolicy());
				  
				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
				System.out.println(oriName + " : " + sysName);
    
				
//				String team_name = multi.getParameter("team_name");
//				String captain_name = multi.getParameter("captain_name");
//				String captain_phone = multi.getParameter("captain_phone");
//				int hometown_code = Integer.parseInt(multi.getParameter("hometown_code"));
//				String outline = multi.getParameter("outline");
//				String content = multi.getParameter("content");
//				TeamDTO dto = new TeamDTO(0, 1001, team_name, team_name, 10000001, hometown_code, outline, content, null, null, null);
//				CreateTeamDAO dao = CreateTeamDAO.getInstance();
//				dao.insertTeam(dto);
//				response.sendRedirect("/list.team?cpage=1"); 
				
			}
			// 생성된 팀 목록 뽑아오기
			else if(cmd.equals("/list.team")) {
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				
				int currentPage = request.getParameter("cpage")==null?1 : Integer.parseInt(request.getParameter("cpage"));
				request.getSession().setAttribute("updateCpage", currentPage);
				int start = (currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE) - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_NAVI_COUNT_PER_PAGE;
				
				List<TeamDTO> teamlist_arr = dao.selectTeam();
				String page_navi = dao.getPageNavi(currentPage);
				
				request.setAttribute("teamlist_arr", teamlist_arr);
				request.setAttribute("navi", page_navi);
				request.getRequestDispatcher("/team/team_list.jsp").forward(request, response); 
			}
			else if(cmd.equals("/page.team")) {
				int team_code = Integer.parseInt(request.getParameter("team_code"));
				response.sendRedirect("/team/team_view.jsp?team_code" + team_code);
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
