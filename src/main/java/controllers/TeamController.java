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
import dao.MemberDAO;
import dao.TeamDAO;
import dto.HometownDTO;
import dto.MemberDTO;
import dto.TeamDTO;


@WebServlet("*.team")
public class TeamController extends HttpServlet {
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf8"); // response의 한글패치
		request.setCharacterEncoding("utf-8"); // request의 한글패치 
		
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		
		Gson g = new Gson();
		String member_id = (String) request.getSession().getAttribute("id");
		
		try {	
			// 팀 생성 시 연고지 목록, 회원 정보 가져오기
			if(cmd.equals("/hometown.team")) {
				
				
				CreateTeamDAO cdao = CreateTeamDAO.getInstance();
				List<HometownDTO> hometown_arr = cdao.select_hometown();
				
				MemberDAO mdao = MemberDAO.getInstance();
				MemberDTO member_info = mdao.select_member(member_id);
				
				request.setAttribute("member_info", member_info);
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
				System.out.println(teamlist_arr);
				request.setAttribute("teamlist_arr", teamlist_arr);
				request.setAttribute("navi", page_navi);
				request.getRequestDispatcher("/team/team_list.jsp").forward(request, response); 
			}
			// 팀 페이지
			else if(cmd.equals("/view.team")) {
				int team_code = Integer.parseInt(request.getParameter("team_code"));
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				TeamDTO team_info = dao.team_info(team_code);
				request.setAttribute("team_info", team_info);
				request.getRequestDispatcher("/team/team_view.jsp").forward(request, response); 
			} else if (cmd.equals("/my_team_list.team")) {
				
//				int member_code = 10000001;
				int member_code = (int) request.getSession().getAttribute("code");
				System.out.println(member_code);
				TeamDAO dao = TeamDAO.getInstance();
				List<TeamDTO> team_list = dao.my_team_list(member_code);
				request.setAttribute("team_list", team_list);
				request.getRequestDispatcher("/member/my_team_list.jsp").forward(request, response);
				
			}else if(cmd.equals("/search.team")) {
				
				String search_team = request.getParameter("search_team");
				TeamDAO dao = TeamDAO.getInstance();
				List<TeamDTO> team_list = dao.search_team_list(search_team);
				request.setAttribute("team_list", team_list);
				request.getRequestDispatcher("/member/my_team_list.jsp").forward(request, response);

				
			} 
			// 팀 리스트에서 팀명 검색 
			else if(cmd.equals("/search_team_name.team")) {
				String team_name = request.getParameter("team_name");
				CreateTeamDAO dao = CreateTeamDAO.getInstance();
				
				
				List<TeamDTO> team_info = dao.search_team_name(team_name);
				String resp = g.toJson(team_info);
				System.out.println(resp);
				response.getWriter().append(resp);	
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
