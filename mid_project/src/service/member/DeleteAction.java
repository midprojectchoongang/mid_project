package service.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MemberDao;
public class DeleteAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(member_id);
		if (result > 0) {
			session.invalidate(); //탈퇴하면 session삭제
		}
		request.setAttribute("result", result);
		return "delete";
	}

}
