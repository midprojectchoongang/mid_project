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

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int application_no = Integer.parseInt(request.getParameter("application_no"));
		String pageNum = request.getParameter("pageNum");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(member_id);
		
		ApplicationDao ad = ApplicationDao.getInstance();
		Application apply = ad.read(application_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("member", member);
		request.setAttribute("apply", apply);
		
		return "updateForm";
	}

}
