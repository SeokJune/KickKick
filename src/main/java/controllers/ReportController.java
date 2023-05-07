package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BoardDAO;
import dao.ReplyDAO;
import dao.ReportDAO;
import dto.BoardDTO;
import dto.ReplyDTO;
import dto.ReportDTO;

@WebServlet("*.report")
public class ReportController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");
		String cmd = request.getRequestURI();
		BoardDAO board_dao = BoardDAO.getInstance();
		ReplyDAO reply_dao = ReplyDAO.getInstance();
		ReportDAO report_dao = ReportDAO.getInstance();
		Gson g = new Gson();
		try {
			if(cmd.equals("/to_report_form.report")) {
				//일단 테이블 이름 얻고
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				request.setAttribute("b_c", b_c);
				String board_name = board_dao.select_board_name(b_c);
				String board_table_name = board_dao.set_table(board_name);
				//board를 신고했는지 reply를 신고했는지 판별
				String tmp_board_code = request.getParameter("board_code");
				String tmp_reply_code = request.getParameter("reply_code");
				if(tmp_board_code!=null && tmp_reply_code==null) {//board를 신고한 경우
					int board_code = Integer.parseInt(tmp_board_code);
					BoardDTO board_dto = board_dao.select_board(board_table_name, board_code);
					request.setAttribute("target", board_dto);
					request.setAttribute("type", "board");
				}
				else if(tmp_board_code==null && tmp_reply_code!=null) {//reply를 신고한 경우
					int reply_code = Integer.parseInt(tmp_reply_code);
					ReplyDTO reply_dto = reply_dao.select_reply(board_table_name, reply_code);
					request.setAttribute("target", reply_dto);
					request.setAttribute("type", "reply");
				}
				
				request.getRequestDispatcher("/report/report_write.jsp").forward(request, response);
			}
			else if(cmd.equals("/insert.report")) {
				//신고자 코드
				int member_code = (int)request.getSession().getAttribute("code");
				//게시판 종류 get
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				//신고 대상이 게시글인지 댓글인지 판별
				String type = request.getParameter("type");
				int board_code=0;
				int reply_code=0;
				if(type.equals("board")) {
					board_code = Integer.parseInt(request.getParameter("target_code"));
				}
				else if(type.equals("reply")) {
					reply_code = Integer.parseInt(request.getParameter("target_code"));
				}
				int report_kind_code = Integer.parseInt(request.getParameter("report_kind"));
				String content = request.getParameter("detail");
				ReportDTO dto = new ReportDTO(member_code,b_c,board_code,reply_code,report_kind_code,content);
				int result = report_dao.insert(dto);
				if(result>0) {
					response.getWriter().append(""+result);
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
