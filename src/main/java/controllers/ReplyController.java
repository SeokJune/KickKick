package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BoardDAO;
import dao.ReplyDAO;
import dto.ReplyDTO;

@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");

		String cmd = request.getRequestURI();
		ReplyDAO rdao = ReplyDAO.getInstance();
		BoardDAO bdao = BoardDAO.getInstance();
		try {
			if(cmd.equals("/insert.reply")) {
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				String board_table_name="";
				if(b_c==1002) {
					board_table_name="ANNOUNCEMENT";
				}
				else if(b_c==1003) {
					board_table_name="FREE";
				}
				else if(b_c==1004) {
					board_table_name="PROMOTION";
				}
				//게시판 코드 그대로 유지
				request.setAttribute("b_c", b_c);
				
				int board_code = Integer.parseInt(request.getParameter("code"));
				int member_code = (int)request.getSession().getAttribute("code");
				String content = request.getParameter("content");
				
				//새로운 댓글을 등록하는데 성공하면
				ReplyDTO insert_rdto = new ReplyDTO(board_code,member_code,content);
				int result = rdao.insert_reply(board_table_name,insert_rdto);
				if(result>0) {
					//해당 글의 모든 댓글 리스트를 담아 보낸다
					List<ReplyDTO> return_rlist = rdao.select_reply_list(board_table_name, board_code);
					Gson g = new Gson();
					String resp = g.toJson(return_rlist);
					response.getWriter().append(resp);
				}
			}
			else if(cmd.equals("/delete.reply")) {
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				int code = Integer.parseInt(request.getParameter("code"));
				String board_table_name = bdao.set_table(bdao.select_board_name(b_c));
				int board_code = Integer.parseInt(request.getParameter("board_code"));
				
				//댓글을 삭제하는데 성공하면
				int result = rdao.delete_reply(board_table_name,code);
				if(result>0) {
					//해당 글의 모든 댓글 리스트를 담아 보낸다
					List<ReplyDTO> return_rlist = rdao.select_reply_list(board_table_name, board_code);
					Gson g = new Gson();
					String resp = g.toJson(return_rlist);
					response.getWriter().append(resp);
				}
			}
			else if(cmd.equals("/update.reply")) {
				int b_c = Integer.parseInt(request.getParameter("b_c"));
				int code = Integer.parseInt(request.getParameter("code"));
				String board_table_name = bdao.set_table(bdao.select_board_name(b_c));
				String content = request.getParameter("content");
				
				int result = rdao.update_reply(board_table_name, new ReplyDTO(code,content));
				if(result>0) {
					response.getWriter().append(""+result);			}
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
