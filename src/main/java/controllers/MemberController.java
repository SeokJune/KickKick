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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String cmd = request.getRequestURI();
		System.out.println(cmd);

		MemberDAO dao = MemberDAO.getInstance();
		Gson g = new Gson();
		try {
			if (cmd.equals("/login_.member")) {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw"); //테스트용 입니다 완료시 삭제
//				String pw = EncryptionUtils.sha512(request.getParameter("pw"));


				boolean result = dao.is_member(id, pw);
				System.out.println("로그인 성공여부 : " + result);
				if(result == true) {
					//닉네임 가져오기
					String nickName = dao.get_nickName_by_id(id);
			        HttpSession session = request.getSession();
			        session.setAttribute("nickName", nickName);
					
			        //login & logout 용 아이디 세션에 저장 & 비번 변경
			        session.setAttribute("id", id);

					//member_code 세션에 저장
					String member_code = dao.get_memberCode_by_id(id);
					session.setAttribute("member_code", member_code);
					
					response.sendRedirect("/index.jsp");
				}else {
					response.sendRedirect("/member/login_view.jsp");
				}
				
				
			} else if (cmd.equals("/phone_auth.member")) {
				System.out.println(request.getParameter("phone"));

				String phone = request.getParameter("phone");
				
				// 이미 가입된 전화번호가 있으면 -> member table에 전화번호 있으면 -> MemberDAO에 class OK
				boolean result = dao.phone_over_check(phone);
				if (!result) {
					// PR할때 이부분 주석해서 올리기***
					String code;
					try {
						code = new SensUtils().sendSMS(phone);
						request.getSession().setAttribute("rand", code);
						response.getWriter().append(code);
						request.getSession().setAttribute("phone", phone);
					} catch (Exception e) {
						e.printStackTrace();
					}
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
				String resp = g.toJson(result);
				response.getWriter().append(resp);
				
				
			} else if (cmd.equals("/phone_over_check.member")) {
				String member_phone = request.getParameter("member_phone");
				boolean result = dao.phone_over_check(member_phone);
				String resp = g.toJson(result);
				response.getWriter().append(resp);
			
				
			} else if (cmd.equals("/email_over_check.member")) {
				String member_email = request.getParameter("member_email");
				boolean result = dao.email_over_check(member_email);
				String resp = g.toJson(result);
				response.getWriter().append(resp);	
				
				
			} else if (cmd.equals("/nickname_over_check.member")) {
				String member_nickname = request.getParameter("member_nickname");
				boolean result = dao.nickname_over_check(member_nickname);
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
					request.setAttribute("member_name", member_name);
					request.getRequestDispatcher("/member/join_form.jsp?status=complete").forward(request, response);
				}else {
					response.sendRedirect("/error.html");
				}
				
			}else if(cmd.equals("/my_profile.member")) {
				//파라미터는 임시로 해둠
				String member_id = request.getParameter("member_id");

				MemberDTO result = MemberDAO.getInstance().select_member(member_id);
				request.setAttribute("profile", result);
				request.getRequestDispatcher("/member/my_profile.jsp").forward(request, response);
				
				
			}else if(cmd.equals("/my_profile.member")) {
				//파라미터는 임시로 해둠
				String member_id = request.getParameter("member_id");

				MemberDTO result = dao.select_member(member_id);
				request.setAttribute("profile", result);
				request.getRequestDispatcher("/member/my_profile.jsp").forward(request, response);
				
				
			}else if(cmd.equals("/change_pw.member")){
				//비밀번호 변경
				String id = (String) request.getSession().getAttribute("id");
				String pw = request.getParameter("password");
				
				dao.update_pw(pw, id);
				
				
			}else if(cmd.equals("/modify_member_profile.member")) {
				String member_id = request.getParameter("member_id");
				//String member_pw = EncryptionUtils.sha512(request.getParameter("member_new_pw")); 비밀번호는 따로 변경
				String member_nickname = request.getParameter("member_nickname");
				String member_birth_date = request.getParameter("member_birth_year")
						+ request.getParameter("member_birth_month")
						+ request.getParameter("member_birth_day");
				String member_phone = request.getParameter("member_phone");
				String member_email = request.getParameter("member_email");
				
				MemberDTO dto = new MemberDTO(0,0,member_id,null,null,member_nickname,member_birth_date,member_phone,member_email,null,0,null,null,null);
				int result = dao.modify_member(dto);
				if(result>0) {
					response.sendRedirect("/my_profile.member?member_id=" + member_id);
				}else {
					response.sendRedirect("/error.html");
				}
				
				
			}else if(cmd.equals("/verify_pw.member")) {
				String id = request.getParameter("id");
				String pw = EncryptionUtils.sha512(request.getParameter("verify_pw"));
				boolean result = dao.is_member(id, pw);
				String resp = g.toJson(result);
				response.getWriter().append(resp);	
				 
			}else if(cmd.equals("/logout.member")){
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("index.jsp");

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
