package service.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDao;
import model.Member;
public class Confirm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String member_id = request.getParameter("member_id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.idChk(member_id);
		int result = 0;
		if (member != null) {
			result = 1;
		} else {
			result = 0;
		}
		request.setAttribute("result", result);
		return "confirm";
	}
}