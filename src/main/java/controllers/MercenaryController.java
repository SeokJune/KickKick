package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MercenaryDAO;
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
		
		try {
			if(cmd.equals("/to_register_form.mercenary")) {
				// 용병 등록하는 폼으로
				response.sendRedirect("/mercenary/register_form.jsp");
				
			}else if(cmd.equals("/to_register_list.mercenary")) {
				// 등록된 용병 보는 리스트로
				List<RegisterInfoDTO> register_list = MercenaryDAO.getInstance().select_register_list();
				
				request.setAttribute("register_list", register_list);
				request.getRequestDispatcher("/mercenary/register_list.jsp").forward(request, response);
				
			}else if(cmd.equals("/to_apply_form.mercenary")) {
				// 나 용병할래요 신청하는 폼으로
				int team_code = Integer.parseInt(request.getParameter("team_code"));
				int competition_result_code = Integer.parseInt(request.getParameter("competition_result_code")); // 매치 코드
				
//				TeamInfoDTO team_info = MercenaryDAO.getInstance().select_team_info(team_code, competition_result_code);
//				
//				request.setAttribute("team_info", team_info);
//				request.getRequestDispatcher("/mercenary/apply_form.jsp").forward(request, response);
				
			}else if(cmd.equals("/to_apply_list.mercenary")) {
				// 신청된 용병 확인하는 폼으로
				response.sendRedirect("/mercenary/apply_list.jsp");
				
			}else if(cmd.equals("/team_check.mercenary")) {
				// 로그인 ID에 맞는 팀 선택할 수 있도록
				// 세션에서 로그인 아이디 받아올 수 있도록 수정
				String login_id = "agji";
				List<TeamDTO> team_select_list = MercenaryDAO.getInstance().select_team_by_id(login_id);

				request.getSession().setAttribute("login_id", login_id);
				request.setAttribute("team_select_list", team_select_list);
				request.getRequestDispatcher("/mercenary/team_check_view.jsp").forward(request, response);
				
			}else if(cmd.equals("/match_check.mercenary")) {
				// 본인 팀이름에 맞는 경기 선택할 수 있도록
				int code = Integer.parseInt(request.getParameter("code"));
				List<CompetitionDTO> match_select_list = MercenaryDAO.getInstance().select_match_by_name(code);
				
				request.setAttribute("match_select_list", match_select_list);
				request.getRequestDispatcher("/mercenary/match_check_view.jsp").forward(request, response);
				
			}else if(cmd.equals("/to_mercenary_register.mercenary")) {
				// DB에 용병 등록하기
				//String match_place = request.getParameter("match_place");
				//String match_date = request.getParameter("match_date");
				int team_code = Integer.parseInt(request.getParameter("team_code"));
				//String team_name = request.getParameter("team_name");
				int ability_code = Integer.parseInt(request.getParameter("ability")); 
				int people_count = Integer.parseInt(request.getParameter("people_count"));
				
				RegisterInfoDTO r = new RegisterInfoDTO(0,0,team_code,ability_code,people_count,0,null,0,0,null);
				
				int result = MercenaryDAO.getInstance().insert_register_mercenary(r);
				if(result>0) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter pwriter = response.getWriter();
					pwriter.println("<script>alert('용병 등록 완료!'); location.href='/index.jsp';</script>"); 
					pwriter.close();
				}
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
