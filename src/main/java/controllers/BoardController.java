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
				String board_table_name=bdao.set_table(board_kind_name);

				//게시판 코드 그대로 유지 -> 세션에 넣는게 좋을까? 세션이 만료되면?
				request.setAttribute("b_c", b_c);

				//현재 페이지 설정
				int current_page = Integer.parseInt(request.getParameter("cpage"));
				request.setAttribute("cpage", current_page);

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
				List<BoardHeadlineDTO> board_headline = bdao.select_board_headline_list();
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
			else if(cmd.equals("/select_post.board")) {
				//어떤 페이지에서 글으로 들어갔는지 기억시키려면
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				request.setAttribute("cpage", cpage);

				//게시판 종류 설정
				String board_kind_name = bdao.select_board_name(Integer.parseInt(request.getParameter("b_c")));
				request.setAttribute("board_kind_name", board_kind_name);
				String board_table_name=bdao.set_table(board_kind_name);

				//게시판 코드 그대로 유지
				request.setAttribute("b_c", request.getParameter("b_c"));

				//글 코드 get
				int code = Integer.parseInt(request.getParameter("c"));
				//조회수 증가
				bdao.add_view_count(board_table_name, code);
				//글 정보 get
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
			else if(cmd.equals("/insert.board")) {
				String board_kind_name = request.getParameter("board");
				String board_table_name = bdao.set_table(board_kind_name);

				String board_headline_name = request.getParameter("headline");
				BoardHeadlineDTO headline_dto = bdao.select_board_headline(board_headline_name);

				int board_kind_code = headline_dto.getBoard_kind_code();
				int board_headline_code = headline_dto.getCode();
				int member_code = (int)request.getSession().getAttribute("code");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				BoardDTO bdto = new BoardDTO(0,board_kind_code,board_headline_code,member_code,title,content,0,0,null,null,null);
				int result = bdao.insert_post(board_table_name,bdto);
				if(result>0) {
					response.sendRedirect("/list.board?b_c="+board_kind_code+"&cpage=1");
				}
			}
			else if(cmd.equals("/to_update_form.board")) {
				//cpage 유지시키기
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				request.setAttribute("cpage", cpage);
				
				//게시판 헤드라인 목록 넣어주고
				List<BoardHeadlineDTO> board_headline = bdao.select_board_headline_list();
				//게시판 종류도 따로 분리해서 넣어주기
				List<String> board_name = new ArrayList<>();
				for(BoardHeadlineDTO b:board_headline) {
					if(!board_name.contains(b.getBoard_name())) {
						board_name.add(b.getBoard_name());
					}
				}
				request.setAttribute("board_list", board_name);
				request.setAttribute("headline_list", board_headline);
				
				//게시판 코드 그대로 유지
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				request.setAttribute("b_c", b_c);

				//게시판 코드로 게시판 이름 get
				String board_kind_name = bdao.select_board_name(b_c);
				request.setAttribute("board_kind_name", board_kind_name);

				//게시판 table명과 글코드로 글 정보 get
				String board_table_name=bdao.set_table(board_kind_name);
				int board_code = Integer.parseInt(request.getParameter("code"));
				BoardDTO bdto = bdao.select_board(board_table_name, board_code);
				request.setAttribute("board", bdto);

				request.getRequestDispatcher("/board/board_update.jsp").forward(request, response);
			}
			else if(cmd.equals("/update.board")) {
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int b_c = Integer.parseInt(request.getParameter("b_c"));

				String board_kind_name = request.getParameter("board");
				String board_table_name=bdao.set_table(board_kind_name);
				int code = Integer.parseInt(request.getParameter("code"));
				String headline_name = request.getParameter("headline");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				BoardDTO bdto = new BoardDTO(code,headline_name,title,content);
				int result = bdao.update_post(board_table_name, bdto);
				//업데이트 할때는 조회수 늘리지 않기
				bdao.substract_view_count(board_table_name, code);
				if(result>0) {
					response.sendRedirect("/select_post.board?b_c="+b_c+"&c="+code+"&cpage="+cpage);
				}
			}
			else if(cmd.equals("/delete.board")) {
				//게시판 종류 설정
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				String board_kind_name = bdao.select_board_name(b_c);
				request.setAttribute("board_kind_name", board_kind_name);
				String board_table_name="";
				if(board_kind_name.equals("공지사항")) {
					board_table_name="ANNOUNCEMENT";
				}
				else if(board_kind_name.equals("자유게시판")) {
					board_table_name="FREE";
				}
				else if(board_kind_name.equals("홍보게시판")) {
					board_table_name="PROMOTION";
				}

				int code = Integer.parseInt(request.getParameter("code"));
				int result = bdao.delete_post(board_table_name,code);
				if(result>0) {
					response.sendRedirect("/list.board?b_c="+b_c+"&cpage=1");
				}
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
