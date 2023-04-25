package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.Encryption;
import dao.MemberDAO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String cmd = request.getRequestURI();
		System.out.println(cmd);

		MemberDAO dao = MemberDAO.getInstance();
		try {
			if (cmd.equals("/login.member")) {
				String id = request.getParameter("id");
				String pw = Encryption.sha512(request.getParameter("pw"));

				boolean result = dao.is_member(id, pw);

				response.sendRedirect("/index.jsp"); // main ȭ��, ������ ���ǿ� ���� ����

				System.out.println("�α��� �������� : " + result);
			} else if (cmd.equals("/findMember.member")) {

				
			} else if (cmd.equals("/id_over_check.member")) {
				String member_id = request.getParameter("member_id");
				boolean result = MemberDAO.getInstance().id_over_check(member_id);
				request.setAttribute("over_check", result);
				request.getRequestDispatcher("/member/id_over_check_view.jsp").forward(request, response);
				
				
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}