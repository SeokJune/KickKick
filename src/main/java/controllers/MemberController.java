package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import commons.EncryptionUtils;
import dao.MemberDAO;
import dto.MemberDTO;

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
				String pw = request.getParameter("pw"); //테스트용 입니다 회원가입기능 완료시 삭제
//				String pw = EncryptionUtils.sha512(request.getParameter("pw"));

				boolean result = dao.is_member(id, pw);

				response.sendRedirect("/index.jsp");// main 화면, 별명은 세션에 저장 예정

				System.out.println("로그인 성공여부 : " + result);
				
				
			} else if (cmd.equals("/find_member.member")) {

				
				
			} else if (cmd.equals("/phone_Certification.member")) {
	            //sens API 사용
	            
				
			} else if (cmd.equals("/id_over_check.member")) {
				String member_id = request.getParameter("member_id");
				boolean result = MemberDAO.getInstance().id_over_check(member_id);
				Gson g = new Gson();
				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
				
			} else if (cmd.equals("/phone_over_check.member")) {
				String member_phone = request.getParameter("member_phone");
				System.out.println(member_phone);
				boolean result = MemberDAO.getInstance().phone_over_check(member_phone);
				Gson g = new Gson();
				String resp = g.toJson(result);
				response.getWriter().append(resp);
			
				
			} else if (cmd.equals("/email_over_check.member")) {
				String member_email = request.getParameter("member_email");
				System.out.println(member_email);
				boolean result = MemberDAO.getInstance().email_over_check(member_email);
				Gson g = new Gson();
				String resp = g.toJson(result);
				response.getWriter().append(resp);	
				
				
			} else if(cmd.equals("/insert_new_member.member")) {
				String member_id = request.getParameter("member_id");
				String member_pw = EncryptionUtils.sha512(request.getParameter("member_pw"));
				String member_name = request.getParameter("member_name");
				String member_nickname = request.getParameter("member_nickname");
				String member_birth_date = request.getParameter("member_birth_year")
											+ request.getParameter("member_birth_month")
											+ request.getParameter("member_birth_day");
				String member_phone = request.getParameter("member_phone1")
						+ request.getParameter("member_phone2") 
						+ request.getParameter("member_phone3");
				String member_email = request.getParameter("member_email");
				String member_agree = request.getParameter("member_agree");
				
				System.out.println(member_id);
				System.out.println(member_pw);
				System.out.println(member_name);
				System.out.println(member_nickname);
				System.out.println(member_birth_date);
				System.out.println(member_phone);
				System.out.println(member_email);
				System.out.println(member_agree);
				MemberDTO dto = new MemberDTO(0,0,member_id,member_pw,member_name,member_nickname,member_birth_date,member_phone,member_email,member_agree,0,null,null,null);
				int result = MemberDAO.getInstance().insert_new_member(dto);
				if(result>0) {
					
				}else {
					response.sendRedirect("/error.html");
				}
				
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
