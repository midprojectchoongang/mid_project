package service.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import dao.ApplicationDao;
import model.Adopt_board;
import model.Application;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum"); 
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int application_no = Integer.parseInt(request.getParameter("application_no"));
		
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String subject = request.getParameter("subject");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String experience = request.getParameter("experience");
		String content = request.getParameter("content");
		
		ApplicationDao ad = ApplicationDao.getInstance();
		Application app = new Application();
		
		app.setApplication_no(application_no);
		app.setLocation_no(location_no);
		app.setSubject(subject);
		app.setEmail(email);
		app.setTel(tel);
		app.setExperience(experience);
		app.setContent(content);
				
		int result = ad.update(app);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("member_id", member_id);
		request.setAttribute("application_no", application_no);
		request.setAttribute("result", result);
		
		return "update";
	}

}
