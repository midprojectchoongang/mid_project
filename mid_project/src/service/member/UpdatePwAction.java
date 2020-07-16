package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class UpdatePwAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String password = request.getParameter("password");

		
		Member member = new Member();
		member.setMember_id(member_id);
		member.setPassword(password);

		
		MemberDao md = MemberDao.getInstance();
		int result = md.updatePw(member);
		
		System.out.println("member_id " + member_id);
		System.out.println("password " + password);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("result", result);
		return "updatePw";
	}

}
