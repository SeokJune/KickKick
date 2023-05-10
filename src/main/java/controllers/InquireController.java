package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.Settings;
import dao.InquireAnswerDAO;
import dao.InquireDAO;
import dto.InquireAnswerDTO;
import dto.InquireDTO;

@WebServlet("*.inquire")
public class InquireController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		String cmd = request.getRequestURI();
		InquireDAO idao = InquireDAO.getInstance();
		try {
			if(cmd.equals("/insert.inquire")) {

				int member_code = (int)request.getSession().getAttribute("code");
				int report_kind_code = Integer.parseInt(request.getParameter("report_kind"));
				String content = request.getParameter("content");

				int result = idao.insert(new InquireDTO(member_code,report_kind_code,content));
				if(result>0) {
					response.sendRedirect("/list.inquire?cpage=1");
				}
			}
			else if(cmd.equals("/list.inquire")) {

				//현재 페이지 설정
				int current_page = Integer.parseInt(request.getParameter("cpage"));
				request.setAttribute("cpage", current_page);
				
				//검색 옵션(내용/작성자) 설정
				String search_option = request.getParameter("search_option");
				if(search_option==null) {
					search_option="content";
				}
				request.setAttribute("search_option", search_option);
				
				//검색어 설정
				String search_word = request.getParameter("search_word");
				if(search_word==null) {
					search_word="";
				}
				request.setAttribute("search_word", search_word);

				//페이지네이션 설정
				String page_navi = idao.get_page_navi(current_page,search_option,search_word);
				int start = current_page*Settings.BOARD_RECORD_COUNT_PER_PAGE-(Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = current_page*Settings.BOARD_RECORD_COUNT_PER_PAGE;
				List<InquireDTO> list = idao.select_inquire_list(start,end,search_option,search_word);

				request.setAttribute("list", list);
				request.setAttribute("navi", page_navi);

				request.getRequestDispatcher("/inquire/inquire_list.jsp").forward(request, response);
			}
			else if(cmd.equals("/to_write_form.inquire")) {

				request.getRequestDispatcher("/inquire/inquire_write.jsp").forward(request, response);
			}
			else if(cmd.equals("/select.inquire")) {
				//현재 페이지 설정
				int current_page = Integer.parseInt(request.getParameter("cpage"));
				request.setAttribute("cpage", current_page);
				
				int code = Integer.parseInt(request.getParameter("c"));
				//문의 글 하나의 정보 받아오기
				InquireDTO idto = idao.select_inquire(code);
				request.setAttribute("inquire", idto);
				
				//답변 리스트 get
				InquireAnswerDAO iadao = InquireAnswerDAO.getInstance();
				List<InquireAnswerDTO> answer_list = iadao.select_answer_list(code);
				request.setAttribute("answer_list", answer_list);
				
				//이전글, 다음글 코드 담긴 배열 get
				int[] code_list = idao.select_prev_next_post(code);
				request.setAttribute("code_list", code_list);
				
				request.getRequestDispatcher("/inquire/inquire_view.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
