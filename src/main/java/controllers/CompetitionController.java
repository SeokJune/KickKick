package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CompetitionDAO;
import dto.AbilityDTO;
import dto.CompetitionKindDTO;
import dto.HometownDTO;
import dto.StatusDTO;
import dto.TeamDTO;


@WebServlet("*.competition")
public class CompetitionController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8;");

		String cmd =request.getRequestURI();

		try {
			if(cmd.equals("/registration.competition")) {

				//팀명 선택
				List<TeamDTO> teamname = CompetitionDAO.getinstance().teamname();
				request.setAttribute("teamname", teamname);
				
				//실력 선택
				List<AbilityDTO> ability = CompetitionDAO.getinstance().ability();
				request.setAttribute("ability", ability);

				//경기 종류 및 인원 선택
				List<CompetitionKindDTO> kind = CompetitionDAO.getinstance().kind();
				request.setAttribute("kind", kind);

				//지역 선택
				List<HometownDTO> hometown = CompetitionDAO.getinstance().hometown();
				request.setAttribute("hometown", hometown);

			
				//상태정보글보내주기
				List<StatusDTO> status = CompetitionDAO.getinstance().status();
				request.setAttribute("status", status);
				
				
				request.getRequestDispatcher("/matching/competition_registration.jsp").forward(request, response);


			}else if(cmd.equals("/list.competition")) {

//				CompetitionDAO.getinstance().selectAll();
				
				response.sendRedirect("/matching/competition_list.jsp");

			}else if(cmd.equals("/send.competition")) {

				
				String ability = request.getParameter("ability");
				String kindnum = request.getParameter("kind");
				String personnum = request.getParameter("person");
				String write = request.getParameter("write");

				String kind = kindnum.substring(0,2);  //앞자리 2자 뽑아옴

				String person = personnum.substring(2,4);  //뒷자리 2자 뽑아옴

				System.out.println(kind);


			}else if(cmd.equals("/choose.competition")) {
				
				System.out.println("비동기통신 확인");
				//팀명선택-팀명,이름,전화번호
				String t = request.getParameter("teamname");

				System.out.println(t);
				
				TeamDTO team = CompetitionDAO.getinstance().team(t);
				List<String> list = new ArrayList<>(); //자바서의 배열이므로 자바스크립트가 알아볼수있게 데이터를 재조립해줘야한다
				list.add(team.getName()); 
				list.add(team.getMember_name());
				list.add(team.getMember_phone());
				Gson g = new Gson(); //gson사용할려고 인스턴스 생성
				String glist = g.toJson(list); //자동직렬화 -> 그래야 데이터가 넘어감?  -> 데이터가 넘어가는 방식이 자동직렬화
				response.getWriter().append(glist); // append를 사용하려면  get writer를 사용할수밖에 없다 이떄 append는 string형밖에 못다룸
			}



		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
