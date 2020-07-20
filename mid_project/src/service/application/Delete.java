package service.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplicationDao;
import model.Application;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int application_no = Integer.parseInt(request.getParameter("application_no"));
		System.out.println(application_no);
		
		ApplicationDao ad = ApplicationDao.getInstance();
		int result = ad.delete(application_no);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "delete";
	}

}
