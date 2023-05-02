package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import commons.EncryptionUtils;
import commons.SensUtils;
import dao.MemberDAO;
import dto.MemberDTO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String cmd = request.getRequestURI();
		System.out.println(cmd);

		MemberDAO dao = MemberDAO.getInstance();
		Gson g = new Gson();
		try {
			if (cmd.equals("/login_chk.member")) {
				String id = request.getParameter("id");
				String pw = EncryptionUtils.sha512(request.getParameter("pw"));

				response.getWriter().append(g.toJson(dao.is_member(id, pw)));
			} else if (cmd.equals("/login.member")) {
				String id = request.getParameter("id");
				// code, 닉네임 가져오기
				MemberDTO info = dao.get_info_by_id(id);
				HttpSession session = request.getSession();
				session.setAttribute("code", info.getCode());
				session.setAttribute("nickname", info.getNick_name());
				
				//login & logout 용 아이디 세션에 저장 & 비번 변경
				session.setAttribute("id", id);

				response.sendRedirect("/");
			} else if (cmd.equals("/phone_auth.member")) {

				String phone = request.getParameter("phone");
				System.out.println(phone);
				// 이미 가입된 전화번호가 있으면 -> member table에 전화번호 있으면 -> MemberDAO에 class OK
				boolean result = dao.phone_over_check(phone);
				System.out.println("result: " + result);
				if (!result) {
					// PR할때 이부분 주석해서 올리기***
					String code = new SensUtils().sendSMS(phone);
					request.getSession().setAttribute("rand", code);
					response.getWriter().append(g.toJson(code));
					request.getSession().setAttribute("phone", phone);
				} else {
					response.getWriter().append(g.toJson(""));
				}
			} else if (cmd.equals("/phone_auth_ok.member")) {
				String rand = (String) request.getParameter("rand");
				String code = (String) request.getParameter("code");
				System.out.println(rand + " : " + code);

				if (rand.equals(code)) { //인증번호 == 입력번호
					request.getSession().removeAttribute("rand");

					//id가져오는 메서드 -> 세션에 저장된 phone 으로 찾기
					String phone = (String) request.getSession().getAttribute("phone");
					String id = dao.get_id_by_phone(phone);
					request.getSession().setAttribute("id", id);
					request.getSession().removeAttribute("phone");
				}
			} else if (cmd.equals("/id_over_check.member")) {
				String member_id = request.getParameter("member_id");
				boolean result = dao.id_over_check(member_id);
				response.getWriter().append(g.toJson(result));
			} else if (cmd.equals("/phone_over_check.member")) {
				String member_phone = request.getParameter("member_phone");
				boolean result = dao.phone_over_check(member_phone);
				response.getWriter().append(g.toJson(result));
			} else if (cmd.equals("/email_over_check.member")) {
				String member_email = request.getParameter("member_email");
				boolean result = dao.email_over_check(member_email);
				response.getWriter().append(g.toJson(result));
			} else if (cmd.equals("/nickname_over_check.member")) {
				String member_nickname = request.getParameter("member_nickname");
				boolean result = dao.nickname_over_check(member_nickname);
				response.getWriter().append(g.toJson(result));
			} else if (cmd.equals("/insert_new_member.member")) {
				String member_id = request.getParameter("member_id");
				String member_pw = EncryptionUtils.sha512(request.getParameter("member_pw"));
				String member_name = request.getParameter("member_name");
				String member_nickname = request.getParameter("member_nickname");
				String member_birth_date = request.getParameter("member_birth_year") + request.getParameter("member_birth_month") + request.getParameter("member_birth_day");
				String member_phone = request.getParameter("member_phone");
				String member_email = request.getParameter("member_email");
				String member_agree = request.getParameter("member_agree");

				MemberDTO dto = new MemberDTO(0, 0, member_id, member_pw, member_name, member_nickname, member_birth_date, member_phone, member_email, member_agree, 0, null, null, null);
				int result = MemberDAO.getInstance().insert_new_member(dto);
				if (result > 0) {
					request.setAttribute("member_name", member_name);
					request.getRequestDispatcher("/member/join_form.jsp?status=complete").forward(request, response);
				} else {
					response.sendRedirect("/error.jsp");
				}
			
			} else if (cmd.equals("/my_profile.member")) {
				String member_id = (String) request.getSession().getAttribute("id");
				MemberDTO result = dao.select_member(member_id);
				request.setAttribute("profile", result);
				request.getRequestDispatcher("/member/my_profile.jsp").forward(request, response);
			} else if (cmd.equals("/change_pw.member")) {
				//비밀번호 변경
				String id = (String) request.getSession().getAttribute("id");
				String pw = request.getParameter("password");

				dao.update_pw(pw, id);
				
			}else if(cmd.equals("/modify_member_profile.member")) {
				String member_id = (String) request.getSession().getAttribute("id");
				String member_confirm_pw = request.getParameter("member_confirm_pw"); 
				String member_new_pw = request.getParameter("member_new_pw"); 
				String member_pw = "";
				if(  member_new_pw != "" ) {
					member_pw =  EncryptionUtils.sha512(member_new_pw);
				} else{
					member_pw = member_confirm_pw;
				}
				
				String member_nickname = request.getParameter("member_nickname");
				String member_birth_date = request.getParameter("member_birth_year")
						+ request.getParameter("member_birth_month")
						+ request.getParameter("member_birth_day");
				String member_phone = request.getParameter("member_phone");
				String member_email = request.getParameter("member_email");
				
				MemberDTO dto = new MemberDTO(0,0,member_id,member_pw,null,member_nickname,member_birth_date,member_phone,member_email,null,0,null,null,null);
				int result = dao.modify_member(dto);
				
				if(result>0) {
					response.sendRedirect("/my_profile.member?member_id=" + member_id);
				}else {
					response.sendRedirect("/error.html");
				}
				
				
			} else if (cmd.equals("/verify_pw.member")) {
				String id = (String) request.getSession().getAttribute("id");
				String pw = EncryptionUtils.sha512(request.getParameter("verify_pw"));
				boolean result = dao.is_member(id, pw);
				response.getWriter().append(g.toJson(result));
			} else if (cmd.equals("/logout.member")) {
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("/");
			} else if (cmd.equals("/delete_member.member")) {
				String id = (String) request.getSession().getAttribute("id");
				int result = dao.delete_member(id);
				if(result>0) {
					HttpSession session = request.getSession();
					session.invalidate();
					response.sendRedirect("/");
				}else {
					response.sendRedirect("/error.html");
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}