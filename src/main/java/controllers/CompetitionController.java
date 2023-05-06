package controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import dto.CompetitionApplicationDTO;
import dto.CompetitionApplyFormDTO;
import dto.CompetitionKindDTO;
import dto.CompetitionListDTO;
import dto.CompetitionRegistrationDTO;
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
				//리스트 출력 값
				List<CompetitionListDTO> list= CompetitionDAO.getinstance().selectlist();
				request.setAttribute("list", list);
				//지역 선택필터	
				List<HometownDTO> hometown = CompetitionDAO.getinstance().hometown();
				request.setAttribute("hometown", hometown);



				request.getRequestDispatcher("/matching/competition_list.jsp").forward(request, response);

			}else if(cmd.equals("/send.competition")) {


				int status = Integer.parseInt(request.getParameter("status"));
				System.out.println(status);//상태코드

				int teamcode = Integer.parseInt(request.getParameter("teamname"));
				System.out.println(teamcode); // 팀 코드

				String hometown = request.getParameter("hometown"); // 지역
				System.out.println(hometown);

				String latlng = request.getParameter("latlng"); //위도경도
				String[] latlngarr = latlng.split(",");
				String lat1 = latlngarr[0]; //위도
				String lng1 = latlngarr[1]; // 경도


				double lat =  Double.parseDouble(lat1);
				double lng =  Double.parseDouble(lng1);

				System.out.println(lat);
				System.out.println(lng);

				String year =  request.getParameter("year");
				String month = request.getParameter("month");
				String day = request.getParameter("day");
				String hour = request.getParameter("hour");
				String minute = request.getParameter("minute");
				String time = year+"-"+month+"-"+day+" "+ hour+":"+minute+":00";
				System.out.println(time);

				Timestamp competitiondate = Timestamp.valueOf(time); //timestamp형으로 반환
				System.out.println(competitiondate); 		//timestamp 에 집어넣을 값


				int ability = Integer.parseInt(request.getParameter("ability")); //실력
				System.out.println(ability);

				String kindnum = request.getParameter("kind"); //경기종류
				String kind = kindnum.substring(0,2);  //앞자리 2자 뽑아옴 -경기종류
				System.out.println(kind);

				String personnum = request.getParameter("person"); // 인원수
				String person = personnum.substring(2,4);  //뒷자리 2자 뽑아옴 - 인원수
				System.out.println(person);

				String kp = kind+person;
				int competitionkindcode = Integer.parseInt(kp); //-------경기종류
				System.out.println(competitionkindcode);


				String write = request.getParameter("write"); //소개글
				System.out.println(write);

				CompetitionRegistrationDTO dto = new CompetitionRegistrationDTO(0,teamcode,competitionkindcode,lat,lng,competitiondate,ability,write,status,null, null,null);
				CompetitionDAO.getinstance().insertreg(dto);


				response.sendRedirect("/list.competition");


			}else if(cmd.equals("/choose.competition")) {

				System.out.println("비동기통신 확인");
				//팀명선택-팀명,이름,전화번호
				String t = request.getParameter("teamname");

				System.out.println(t);

				TeamDTO team = CompetitionDAO.getinstance().team(t);

				String logo_path = team.getLogo_path();
				String logo = team.getLogo();
				String pic = logo_path+logo; //사진 경로


				List<String> list = new ArrayList<>(); //자바서의 배열이므로 자바스크립트가 알아볼수있게 데이터를 재조립해줘야한다

				list.add(team.getName()); 
				list.add(team.getMember_name());
				list.add(team.getMember_phone());
				list.add(pic);
				System.out.println(list);

				Gson g = new Gson(); //gson사용할려고 인스턴스 생성
				String glist = g.toJson(list); //자동직렬화 -> 그래야 데이터가 넘어감?  -> 데이터가 넘어가는 방식이 자동직렬화
				response.getWriter().append(glist); // append를 사용하려면  get writer를 사용할수밖에 없다 이떄 append는 string형밖에 못다룸

			}else if(cmd.equals("/applyform.competition")) {
				String date = request.getParameter("date");

				//				SimpleDateFormat sdf = SimpleDateFormat("YYYY-MM-DD HH-MI-SS");
				//				Date d = sdf.parse(date);
				//				new Timestamp(d.getYear(); string형 날짜를 timestamp로 변환하는 과정


				System.out.println(date);
				CompetitionApplyFormDTO form = CompetitionDAO.getinstance().show_applyform(date);
				request.setAttribute("form", form);

				//로그인할때의 code의 세션값을 가져옴
				int code = (int) request.getSession().getAttribute("code");
				request.setAttribute("code", code);

				//신청하는 팀의 실력 선택
				List<AbilityDTO> ability = CompetitionDAO.getinstance().ability();
				request.setAttribute("ability", ability);

				//상태정보가져오기
				List<StatusDTO> status = CompetitionDAO.getinstance().status();
				request.setAttribute("status", status);

				request.getRequestDispatcher("/matching/competition_application.jsp").forward(request, response);
			}else if(cmd.equals("/apply.competition")){
				String status1 = request.getParameter("status");
				int status = Integer.parseInt(status1);
				
				String rcode1 = request.getParameter("rcode");
				int rcode = Integer.parseInt(rcode1);
				
				String tcode1 = request.getParameter("tcode");
				int tcode = Integer.parseInt(tcode1);
				
				String ability1 = request.getParameter("ability");
				int ability = Integer.parseInt(ability1);
				
				String content = request.getParameter("content");
				
				System.out.println(status);
				System.out.println(rcode);
				System.out.println(tcode);
				System.out.println(ability);
				System.out.println(content);

				CompetitionApplicationDTO dto = new CompetitionApplicationDTO(0,rcode,tcode,ability,content,status,null,null,null);
				CompetitionDAO.getinstance().apply(dto);
				
				response.sendRedirect("/matching/competition_list.jsp");

			}



		}catch(Exception e) {
			e.printStackTrace();
		}
	}





	private SimpleDateFormat SimpleDateFormat(String string) {
		// TODO Auto-generated method stub
		return null;
	}





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
