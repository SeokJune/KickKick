package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dao.ReplyDAO;
import dao.ReportDAO;
import dto.BoardDTO;
import dto.ReplyDTO;

@WebServlet("*.report")
public class ReportController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		String cmd = request.getRequestURI();
		BoardDAO board_dao = BoardDAO.getInstance();
		ReplyDAO reply_dao = ReplyDAO.getInstance();
		ReportDAO report_dao = ReportDAO.getInstance();
		try {
			if(cmd.equals("/to_report_form.report")) {
				//일단 테이블 이름 얻고
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				String board_name = board_dao.select_board_name(b_c);
				String board_table_name = board_dao.set_table(board_name);
				//board를 신고했는지 reply를 신고했는지 판별
				String tmp_board_code = request.getParameter("board_code");
				String tmp_reply_code = request.getParameter("reply_code");
				if(tmp_board_code!=null && tmp_reply_code==null) {//board를 신고한 경우
					int board_code = Integer.parseInt(tmp_board_code);
					BoardDTO board_dto = board_dao.select_board(board_table_name, board_code);
					request.setAttribute("target", board_dto);
				}
				else if(tmp_board_code==null && tmp_reply_code!=null) {//reply를 신고한 경우
					int reply_code = Integer.parseInt(tmp_reply_code);
					ReplyDTO reply_dto = reply_dao.select_reply(board_table_name, reply_code);
					request.setAttribute("target", reply_dto);
				}
				
				request.getRequestDispatcher("/report/report_write.jsp").forward(request, response);
			}
			else if(cmd.equals("/insert.report")) {

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
