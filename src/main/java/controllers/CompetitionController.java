package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CompetitionDAO;
import dto.AbilityDTO;
import dto.CompetitionKindDTO;
import dto.HometownDTO;


@WebServlet("*.competition")
public class CompetitionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf8");
	response.setContentType("text/html; charset=utf8;");
	
	String cmd =request.getRequestURI();
	
	try {
		if(cmd.equals("/registration.competition")) {
			
			//실력 선택
			List<AbilityDTO> ability = CompetitionDAO.getinstance().ability();
			request.setAttribute("ability", ability);
			
			//경기 종류 및 인원 선택
			List<CompetitionKindDTO> kind = CompetitionDAO.getinstance().kind();
			request.setAttribute("kind", kind);
			
			//지역 선택
			List<HometownDTO> hometown = CompetitionDAO.getinstance().hometown();
			request.setAttribute("hometown", hometown);
			
			
			request.getRequestDispatcher("/matching/competition_registration.jsp").forward(request, response);
			
			
		}else if(cmd.equals("/list.competition")) {
			
			response.sendRedirect("/matching/competition_list.jsp");
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
