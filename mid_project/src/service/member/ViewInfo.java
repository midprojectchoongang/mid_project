package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LocationDao;
import dao.MemberDao;
import model.Location;
import model.Member;

public class ViewInfo implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(member_id);
		
		LocationDao ld = LocationDao.getInstance();
		
		Location location = ld.select(member.getLocation_no());
		System.out.println("location 전");
		
		request.setAttribute("location", location);
		request.setAttribute("member", member);
		return "viewInfo";
	}
}