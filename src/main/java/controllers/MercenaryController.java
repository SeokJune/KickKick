package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import commons.Settings;
import dao.MercenaryDAO;
import dto.ApplyDTO;
import dto.CompetitionDTO;
import dto.RegisterInfoDTO;
import dto.TeamDTO;

@WebServlet("*.mercenary")
public class MercenaryController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		Gson g = new Gson();
		
		try {
			if(cmd.equals("/to_register_form.mercenary")) {
				// 용병 등록하는 폼으로
				response.sendRedirect("/mercenary/register_form.jsp");
				
			}else if(cmd.equals("/to_register_list.mercenary")) {
				// 등록된 용병 보는 리스트로
				// 세션에서 로그인 아이디 받아올 수 있도록 수정
				String id = (String) request.getSession().getAttribute("id");
				System.out.println(id);
				MercenaryDAO dao = MercenaryDAO.getInstance();
				
				String searchOption = request.getParameter("searchOption") == null ? "team_name" : request.getParameter("searchOption");
				String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				
				int start = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE - (Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.BOARD_RECORD_COUNT_PER_PAGE;
				String pageNavi = dao.getPageNavi(currentPage, searchOption, searchWord);
				List<RegisterInfoDTO> register_list = MercenaryDAO.getInstance().select_register_list(start ,end, searchOption, searchWord);
				
				request.setAttribute("id", id);
				request.setAttribute("ctPage", currentPage);
				request.setAttribute("register_list", register_list);
				request.setAttribute("navi", pageNavi);
				request.getRequestDispatcher("/mercenary/register_list.jsp").forward(request, response);
				
			}else if(cmd.equals("/to_register_modify_form.mercenary")) {
				// 용병 등록 수정하는 폼으로
				int mercenary_registration_code = Integer.parseInt(request.getParameter("code"));
				
				ApplyDTO modify_form_info = MercenaryDAO.getInstance().select_register_modify_form(mercenary_registration_code);
				
				int ctPage = Integer.parseInt(request.getParameter("ctPage"));

				request.setAttribute("ctPage", ctPage);
				request.setAttribute("modify_form_info", modify_form_info);
				request.getRequestDispatcher("/mercenary/register_modify_form.jsp").forward(request, response);
				
			}else if(cmd.equals("/to_apply_form.mercenary")) {
				// 나 용병할래요 신청하는 폼으로
				MercenaryDAO dao = MercenaryDAO.getInstance();
				
				int code = Integer.parseInt(request.getParameter("code"));
				int ctPage = Integer.parseInt(request.getParameter("cpage"));
				ApplyDTO apply_info = dao.select_apply_form_info(code);
				
				request.setAttribute("code", code);
				request.setAttribute("ctPage", ctPage);
				request.setAttribute("apply_info", apply_info);
				request.getRequestDispatcher("/mercenary/apply_form.jsp").forward(request, response);
				
			}else if(cmd.equals("/to_apply_list.mercenary")) {
				// 신청된 용병 확인하는 폼으로
				response.sendRedirect("/mercenary/apply_list.jsp");
				
			}else if(cmd.equals("/team_check.mercenary")) {
				// 로그인 ID에 맞는 팀 선택할 수 있도록
				// 세션에서 로그인 아이디 받아올 수 있도록 수정
				String id = (String) request.getSession().getAttribute("id");
				List<TeamDTO> team_select_list = MercenaryDAO.getInstance().select_team_by_id(id);

				request.getSession().setAttribute("id", id);
				request.setAttribute("team_select_list", team_select_list);
				request.getRequestDispatcher("/mercenary/team_check_view.jsp").forward(request, response);
				
			}else if(cmd.equals("/match_check.mercenary")) {
				// 본인 팀이름에 맞는 경기 선택할 수 있도록
				int code = 0;
				if(request.getParameter("code")==""){
					code=0;
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter pwriter = response.getWriter();
					pwriter.println("<script>alert('팀을 먼저 선택해 주세요!'); window.close();</script>"); 
					pwriter.close();
				}else {
					code = Integer.parseInt(request.getParameter("code"));

					List<CompetitionDTO> match_select_list = MercenaryDAO.getInstance().select_match_by_name(code);
					request.setAttribute("match_select_list", match_select_list);
					request.getRequestDispatcher("/mercenary/match_check_view.jsp").forward(request, response);
				}
				
			}else if(cmd.equals("/to_mercenary_register.mercenary")) {
				// DB에 용병 등록하기
				int team_code = Integer.parseInt(request.getParameter("code"));
				int competition_registration_code = Integer.parseInt(request.getParameter("competition_registration_code"));
				int ability_code = Integer.parseInt(request.getParameter("ability")); 
				int people_count = Integer.parseInt(request.getParameter("people_count"));

				RegisterInfoDTO r = new RegisterInfoDTO(0,competition_registration_code,team_code,ability_code,people_count,2101,null,0,0,null,null);
				
				int result = MercenaryDAO.getInstance().insert_register_mercenary(r);
				if(result>0) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter pwriter = response.getWriter();
					pwriter.println("<script>alert('용병 등록 완료!'); location.href='/index.jsp';</script>"); 
					pwriter.close();
				}
			}else if(cmd.equals("/to_mercenary_apply.mercenary")) {
				// DB에 용병 신청하기
				// 세션에서 로그인 아이디 받아올 수 있도록 수정
				String id = (String) request.getSession().getAttribute("id");
				
				int code = Integer.parseInt(request.getParameter("mercenary_registration_code"));
				int ability_code = Integer.parseInt(request.getParameter("ability_code"));
				String content = request.getParameter("content");
				
				int result = MercenaryDAO.getInstance().insert_apply_mercenary(new ApplyDTO(code,ability_code,id,content));
				if(result>0) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter pwriter = response.getWriter();
					pwriter.println("<script>alert('용병 신청 완료!'); location.href='/to_register_list.mercenary?cpage=1';</script>"); 
					pwriter.close();
				}
				
			}else if(cmd.equals("/register_btn_ajax.mercenary")){
				// 용병을 이미 등록했는지 확인
				int team_code = Integer.parseInt(request.getParameter("code"));
				int competition_registration_code = Integer.parseInt(request.getParameter("competition_registration_code"));

				boolean result = MercenaryDAO.getInstance().is_exist_mercenary_register(team_code, competition_registration_code);
				
				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
			}else if(cmd.equals("/apply_same_team_ajax.mercenary")) {
				// 로그인 ID의 팀 코드와 신청하려는 팀 코드가 같은지 검사
				// 세션에서 로그인 아이디 받아올 수 있도록 수정
				String id = (String) request.getSession().getAttribute("id");
				
				int team_code = Integer.parseInt(request.getParameter("team_code"));

				boolean result = MercenaryDAO.getInstance().is_apply_same_team(id, team_code);

				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
			}else if(cmd.equals("/apply_btn_ajax.mercenary")) {
				// 로그인 ID의 팀 코드와 신청하려는 팀 코드가 같은지 검사
				// 세션에서 로그인 아이디 받아올 수 있도록 수정
				String id = (String) request.getSession().getAttribute("id");
				
				int competition_result_code = Integer.parseInt(request.getParameter("competition_result_code"));
				
				boolean result = MercenaryDAO.getInstance().is_exist_mercenary_apply(id, competition_result_code);
				
				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
			}else if(cmd.equals("/apply_list_ajax.mercenary")) {
				// apply_list 해당하는 데이터 추출
				int team_code = Integer.parseInt(request.getParameter("code"));
				int competition_registration_code = Integer.parseInt(request.getParameter("competition_registration_code"));
				
				List<ApplyDTO> apply_list = MercenaryDAO.getInstance().select_apply_list(new ApplyDTO(team_code,competition_registration_code));
				
				String resp = g.toJson(apply_list);
				response.getWriter().append(resp);
				
			}else if(cmd.equals("/apply_modify_status_ajax.mercenary")) {
				// 수락, 거절 버튼에 따른 status 수정
				MercenaryDAO dao = MercenaryDAO.getInstance();
				
				String status = request.getParameter("status");
				int mercenary_application_code = Integer.parseInt(request.getParameter("mercenary_application_code"));
				int mercenary_registration_code = Integer.parseInt(request.getParameter("mercenary_registration_code"));
				int headcount = Integer.parseInt(request.getParameter("headcount"));
				
				int count = dao.count_apply_accept(mercenary_registration_code);
				int result = 0;
				if(count < headcount) {
					result = dao.modify_apply_list_status(status, mercenary_application_code);
				}else {
					result = 2;
				}
				
				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
			}else if(cmd.equals("/modify_mercenary_register.mercenary")) {
				// register_list 해당 등록 수정
				int code = Integer.parseInt(request.getParameter("code"));
				int ability_code = Integer.parseInt(request.getParameter("ability")); 
				int people_count = Integer.parseInt(request.getParameter("people_count"));
				int ctPage = Integer.parseInt(request.getParameter("cpage"));
				
				int result = MercenaryDAO.getInstance().modify_mercenary_register(code, ability_code, people_count);
				if(result>0) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter pwriter = response.getWriter();
					pwriter.println("<script>alert('수정 완료!'); location.href='/to_register_list.mercenary?cpage="+ctPage+"';</script>"); 
					pwriter.close();
				}
				
			}else if(cmd.equals("/delete_mercenary_register_ajax.mercenary")) {
				// register_list 해당 등록 삭제 
				int code = Integer.parseInt(request.getParameter("code"));
				
				int result = MercenaryDAO.getInstance().delete_mercenary_registration(code);
				
				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
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
