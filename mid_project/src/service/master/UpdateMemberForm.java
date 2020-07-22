package service.master;

import javax.servlet.http.*;

import dao.MemberDao;
import model.Member;


public class UpdateMemberForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String member_id = request.getParameter("member_id");
		String pageNum = request.getParameter("pageNum");
		
		MemberDao md = MemberDao.getInstance();
		Member updateMem = md.idChk(member_id);
		
		request.setAttribute("updateMem", updateMem);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		return "updateMemberForm";
	}
}