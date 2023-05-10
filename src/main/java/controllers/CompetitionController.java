package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import commons.Settings;
import dao.CompetitionDAO;
import dto.AbilityDTO;
import dto.CompetitionApplicationDTO;
import dto.CompetitionApplicationListDTO;
import dto.CompetitionApplyFormDTO;
import dto.CompetitionDTO;
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
			if(cmd.equals("/registration.competition")) { //매칭등록페이지에 출력해줄것들

				int code = (int) request.getSession().getAttribute("code");

				//팀명 선택
				List<TeamDTO> teamname = CompetitionDAO.getinstance().teamname(code);
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


			}else if(cmd.equals("/list.competition")) { //리스트페이지에 출력해줄것들 
				int currentpage = Integer.parseInt(request.getParameter("cpage"));
				request.getSession().setAttribute("ucpage", currentpage); //리스트 페이지 초기설정 (1페이지로)

				int start= (currentpage* Settings.BOARD_RECORD_COUNT_PER_PAGE)-(Settings.BOARD_RECORD_COUNT_PER_PAGE - 1 );
				int end = currentpage*Settings.BOARD_NAVI_COUNT_PER_PAGE;
				System.out.println(start);
				System.out.println(end);
				List<CompetitionListDTO> list = CompetitionDAO.getinstance().selectlist(start, end);
				String pageNavi = CompetitionDAO.getinstance().getPageNavi(currentpage);

				request.setAttribute("list",  list);
				request.setAttribute("navi",  pageNavi);

				//				//리스트 출력 값
				//				List<CompetitionListDTO> list= CompetitionDAO.getinstance().selectlist();
				//				request.setAttribute("list", list);
				//

				//지역 선택필터	
				List<HometownDTO> hometown = CompetitionDAO.getinstance().hometown();
				request.setAttribute("hometown", hometown);

				request.getRequestDispatcher("/matching/competition_list.jsp").forward(request, response);

			}else if(cmd.equals("/search.competition")) { //리스트페이지에서 검색버튼 불렀을때



				String searching = 	request.getParameter("searching");
				System.out.println(searching);

				if(searching != null && !searching.equals("") ) {
					List<CompetitionListDTO> result = CompetitionDAO.getinstance().search(searching);
					System.out.println(result);


					if(result.size() == 0) { //검색한결과가 없으면 처음화면으로
						response.sendRedirect("/list.competition?cpage=1");
					}else {
						request.setAttribute("result", result);
					}

				}else{
					response.sendRedirect("/list.competition?cpage=1");
				}

				request.getRequestDispatcher("/matching/competition_list.jsp").forward(request, response);


			}else if(cmd.equals("/send.competition")) {//매칭등록했을때 db에넣을것



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


				response.sendRedirect("/list.competition?cpage=1");


			}else if(cmd.equals("/choose.competition")) { //매칭등록페이지에서 내가 가입한 팀중 하나를 눌렀을떄 비동기통신으로 해당팀의 값 가져오는것

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

			}else if(cmd.equals("/applyform.competition")) { //리스트들에 있는 팀들 중 한 팀을 눌렀을때
				String date = request.getParameter("date");
				String rcode = request.getParameter("code"); //매칭등록했을때 해당 글의 고유의 번호
				//				SimpleDateFormat sdf = SimpleDateFormat("YYYY-MM-DD HH-MI-SS");
				//				Date d = sdf.parse(date);
				//				new Timestamp(d.getYear(); string형 날짜를 timestamp로 변환하는 과정

				CompetitionApplyFormDTO form = CompetitionDAO.getinstance().show_applyform(date);
				request.setAttribute("form", form);


				//로그인할때의 code의 세션값을 가져옴
				int code = (int) request.getSession().getAttribute("code");
				request.setAttribute("code", code);

				//로그인한 사람의 code가 가입되어있는 팀들중 하나 선택해서 그 팀의 코드 가져와야함
				List<TeamDTO> team = CompetitionDAO.getinstance().getteamcode(code);
				request.setAttribute("team", team);


				//신청하는 팀의 실력 선택
				List<AbilityDTO> ability = CompetitionDAO.getinstance().ability();
				request.setAttribute("ability", ability);

				//상태정보가져오기
				List<StatusDTO> status = CompetitionDAO.getinstance().status();
				request.setAttribute("status", status);

				//로그인한 사람이랑 글쓴 사람이 같을때 리스트에 출력 - 신청받아주거나 거절하거나
				List<CompetitionApplicationListDTO> match =	CompetitionDAO.getinstance().selectmatch(rcode);
				request.setAttribute("match", match);


				request.getRequestDispatcher("/matching/competition_application.jsp").forward(request, response);

			}else if(cmd.equals("/apply.competition")){ //신청하기를 눌렀을때 db에 넣는것


				String status1 = request.getParameter("status");
				System.out.println(status1);
				int status = Integer.parseInt(status1);

				String rcode1 = request.getParameter("rcode");
				System.out.println(rcode1);
				int rcode = Integer.parseInt(rcode1);

				String tcode1 = request.getParameter("tcode");
				System.out.println(tcode1);
				int tcode = Integer.parseInt(tcode1);


				String ability1 = request.getParameter("ability");
				System.out.println(ability1);
				int ability = Integer.parseInt(ability1);

				String content = request.getParameter("content");
				System.out.println(content);



				CompetitionApplicationDTO dto = new CompetitionApplicationDTO(0,rcode,tcode,ability,content,status,null,null,null);
				CompetitionDAO.getinstance().apply(dto);



			}else if(cmd.equals("/deleteform.competition")) {//신청폼에서 삭제하기를 눌렀을때
				String delcode = request.getParameter("delcode");

				System.out.println(delcode);

				CompetitionDAO.getinstance().delete_application(delcode);


			}else if(cmd.equals("/acceptform.competition")) { //신청폼에서 수락하기를 눌렀을때


				String reg_code1 = request.getParameter("reg_code"); //해당글의 코드 
				String team_code1 = request.getParameter("team_code"); //해당 팀의 코드
				String reg_team_code1 = request.getParameter("reg_team_code"); //해당글을 올린 팀의 코드


				int reg_code = Integer.parseInt(reg_code1);
				int team_code = Integer.parseInt(team_code1);
				int reg_team_code = Integer.parseInt(reg_team_code1);


				int result = CompetitionDAO.getinstance().accept1(reg_code,team_code); //수락된건 1202



				CompetitionDAO.getinstance().accept2(reg_code,team_code); //수락되고 난 나머지는 1203

				CompetitionDAO.getinstance().team_result(team_code, reg_code, reg_team_code); //competition_result테이블에 값 넣어주는것
				
				//매칭리스트를 뽑아주는거에 수락된 그 글의 고유번호를 통해 지워야한다
				response.sendRedirect("/deletelist_competition?reg_code="+reg_code);
		
				System.out.println("3");
				
			}else if(cmd.equals("/deletelist_competition")) {// 수락한 팀의글을 리스트에서 지우는거
				
				System.out.println("1");
				String reg_code = request.getParameter("reg_code");
				System.out.println(reg_code);
				System.out.println("2");

			}else if(cmd.equals("/refuseform.competition")) {//신청폼에서 거절하기를 눌렀을때

				String reg_code1 = request.getParameter("reg_code"); //해당글의 코드 

				String team_code1 = request.getParameter("team_code"); //해당 팀의 코드

				int reg_code = Integer.parseInt(reg_code1);
				int team_code = Integer.parseInt(team_code1);

				System.out.println(reg_code1);
				System.out.println(team_code1);


				int result = CompetitionDAO.getinstance().refuse(team_code,reg_code);
				System.out.println(result);

			}
			
			// 캘린더에 띄울 날짜별 매칭된 경기수
			//			else if(cmd.equals("/count_game.competition")) {
			//				String year = (request.getParameter("year")).substring(2);
			//				String month = request.getParameter("month");
			//				if(month.length() == 1) {
			//					month = 0 + month;
			//				}
			//				String day = request.getParameter("day");
			//				if(day.length() == 1) {
			//					day = 0 + day;
			//				}
			//				String date = year + "/" + month + "/" + day;
			//				List<CompetitionDTO> game_list = CompetitionDAO.getinstance().match_game_list(date);
			//				
			//				Gson g = new Gson();
			//				String dto_game_list = g.toJson(game_list);
			//				JsonObject resp = new JsonObject();
			//				resp.addProperty("events", dto_game_list);
			//				response.getWriter().append(resp.toString());
			//			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}










	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
