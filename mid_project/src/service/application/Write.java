package service.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import dao.ApplicationDao;
import dao.MemberDao;
import model.Adopt_board;
import model.Application;
import model.Member;

public class Write implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum"); 
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		
		System.out.println("a " + adopt_no);
		
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String subject = request.getParameter("subject");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String experience = request.getParameter("experience");
		String content = request.getParameter("content");
		
		Adopt_boardDao abd = Adopt_boardDao.getInstance();
		Adopt_board adopt = abd.read(adopt_no);
		ApplicationDao ad = ApplicationDao.getInstance();
		Application app = new Application();
		
		app.setMember_id(member_id);
		app.setAdopt_no(adopt_no);
		app.setLargecate_id(adopt.getLargecate_id());
		app.setSmallcate_id(adopt.getSmallcate_id());
		app.setLocation_no(location_no);
		app.setSubject(subject);
		app.setGender(gender);
		app.setEmail(email);
		app.setTel(tel);
		app.setExperience(experience);
		app.setContent(content);
				
		int result = ad.apply(app);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "writeForm";
	}

}
