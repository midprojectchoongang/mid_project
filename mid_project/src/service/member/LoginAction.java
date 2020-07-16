package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		String password = request.getParameter("password");
		MemberDao md =MemberDao.getInstance();
		int result = md.loginChk(member_id,password);
		if (result > 0) {
			HttpSession sessioin = request.getSession();
			sessioin.setAttribute("member_id", member_id);
		}
		request.setAttribute("result", result);
		return "login";
	}

}
