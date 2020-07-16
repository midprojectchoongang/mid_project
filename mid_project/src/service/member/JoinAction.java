package service.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String experience = request.getParameter("experience");
		Member member = new Member();
		member.setMember_id(member_id);
		member.setPassword(password);
		member.setName(name);
		member.setGender(gender);
		member.setEmail(email);
		member.setTel(tel);
		member.setLocation_no(location_no);
		member.setExperience(experience);
		
		MemberDao md = MemberDao.getInstance();
		int result = md.insert(member);
		request.setAttribute("result", result);
		return "join";
	}

}
