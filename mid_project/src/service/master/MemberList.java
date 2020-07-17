package service.master;
import java.util.*;
import javax.servlet.http.*;
import dao.MemberDao;
import model.Member;
public class MemberList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MemberDao md = MemberDao.getInstance();
		List<Member> list = md.list();
		request.setAttribute("list", list);
		return "memberList";
	}
}