package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class MemberInfo implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id =(String)session.getAttribute("member_id");
		if (member_id != null) {
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(member_id);
			request.setAttribute("member", member);
		}
		return "memberInfo";
	}
}