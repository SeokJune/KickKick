package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardHeadlineDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		
		String cmd = request.getRequestURI();
		BoardDAO bdao = BoardDAO.getInstance();
		
		try {
		if(cmd.equals("/to_write_form.board")) {
			
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
			
		}
		else if(cmd.equals("/list.board")) {
			response.sendRedirect("/board/board_list.jsp");
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
