package service.master;

import javax.servlet.http.*;

import dao.MemberDao;
import model.Member;


public class UpdateMember implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String member_id = request.getParameter("member_id");
		String pageNum = request.getParameter("pageNum");
		
		String del_be = "";
		MemberDao md = MemberDao.getInstance();
		Member updateMem = md.idChk(member_id);
		if (updateMem.getDel().equals("n")) {
			del_be = "y";
		}
		else {
			del_be = "n";
		}
		int result = md.delMaster(member_id, del_be);
		
		request.setAttribute("result", result);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		return "updateMember";
	}
}