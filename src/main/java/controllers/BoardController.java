package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.Settings;
import dao.BoardDAO;
import dao.ReplyDAO;
import dto.BoardDTO;
import dto.BoardHeadlineDTO;
import dto.ReplyDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");

		String cmd = request.getRequestURI();
		BoardDAO bdao = BoardDAO.getInstance();

		try {
			if(cmd.equals("/list.board")) {
				//게시판 종류 설정
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				String board_kind_name = bdao.select_board_name(b_c);
				request.setAttribute("board_kind_name", board_kind_name);
				String board_table_name="";
				if(board_kind_name.equals("공지사항")) {
					board_table_name="announcement";
				}
				else if(board_kind_name.equals("자유게시판")) {
					board_table_name="free";
				}
				else if(board_kind_name.equals("홍보게시판")) {
					board_table_name="promotion";
				}
				else if(board_kind_name.equals("문의하기")) {
					board_table_name="inquire";
				}
				//게시판 코드 그대로 유지 -> 세션에 넣는게 좋을까? 세션이 만료되면?
				request.setAttribute("b_c", b_c);

				//현재 페이지 설정
				int current_page = Integer.parseInt(request.getParameter("cpage"));
				request.getSession().setAttribute("cpage", current_page);

				//검색 옵션(제목/내용/작성자) 설정
				String search_option = request.getParameter("search_optin");
				if(search_option==null) {
					search_option="title";
				}

				//검색어 설정
				String search_word = request.getParameter("search_word");
				if(search_word==null) {
					search_word="";
				}

				//페이지네이션 설정
				String page_navi = bdao.get_page_navi(b_c,board_table_name, current_page,search_option,search_word);
				int start = current_page*Settings.BOARD_RECORD_COUNT_PER_PAGE-(Settings.BOARD_RECORD_COUNT_PER_PAGE-1);
				int end = current_page*Settings.BOARD_RECORD_COUNT_PER_PAGE;
				List<BoardDTO> list = bdao.select_board_list(board_table_name,start,end,search_option,search_word);

				request.setAttribute("list", list);
				request.setAttribute("navi", page_navi);

				request.getRequestDispatcher("/board/board_list.jsp").forward(request, response);
			}
			else if(cmd.equals("/to_write_form.board")) {

				//어떤 게시판에서 글쓰기 눌렀냐에 따라 게시판 select 자동 선택
				String board_kind_name = request.getParameter("b_n");
				request.setAttribute("board_kind_name", board_kind_name);

				//게시판 헤드라인 목록 가져오기
				List<BoardHeadlineDTO> board_headline = bdao.select_board_headline();
				//게시판 종류도 따로 분리
				List<String> board_name = new ArrayList<>();
				for(BoardHeadlineDTO b:board_headline) {
					if(!board_name.contains(b.getBoard_name())) {
						board_name.add(b.getBoard_name());
					}
				}
				request.setAttribute("board_list", board_name);
				request.setAttribute("headline_list", board_headline);

				request.getRequestDispatcher("/board/board_write.jsp").forward(request, response);
			}
			else if(cmd.equals("/insert.board")) {
				int board_kind_code = Integer.parseInt(request.getParameter(""));
				String member_code = (String)request.getSession().getAttribute("login_id");

			}
			else if(cmd.equals("/select_post.board")) {
				//어떤 페이지에서 글으로 들어갔는지 기억시키려면
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				request.setAttribute("cpage", cpage);
				
				//게시판 종류 설정
				String board_kind_name = bdao.select_board_name(Integer.parseInt(request.getParameter("b_c")));
				request.setAttribute("board_kind_name", board_kind_name);
				String board_table_name="";
				if(board_kind_name.equals("공지사항")) {
					board_table_name="announcement";
				}
				else if(board_kind_name.equals("자유게시판")) {
					board_table_name="free";
				}
				else if(board_kind_name.equals("홍보게시판")) {
					board_table_name="promotion";
				}
				//문의하기 게시판은 컬럼이 다르니까 따로 처리하자

				//게시판 코드 그대로 유지
				request.setAttribute("b_c", request.getParameter("b_c"));
				
				//글 코드 get
				int code = Integer.parseInt(request.getParameter("c"));
				BoardDTO board_contents = bdao.select_board(board_table_name, code);
				request.setAttribute("board", board_contents);
				
				//댓글 리스트 get
				ReplyDAO rdao = ReplyDAO.getInstance();
				List<ReplyDTO> reply_list = rdao.select_reply_list(board_table_name, code);
				request.setAttribute("reply_list", reply_list);
				
				//이전글, 다음글 코드 담긴 배열 get
				int[] code_list = bdao.select_prev_next_post(board_table_name, code);
				request.setAttribute("code_list", code_list);
				
				request.getRequestDispatcher("/board/board_view.jsp").forward(request, response);
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
