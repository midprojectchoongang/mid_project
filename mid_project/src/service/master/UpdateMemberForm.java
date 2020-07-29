package service.master;

import javax.servlet.http.*;

import dao.LocationDao;
import dao.MemberDao;
import model.Member;


public class UpdateMemberForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String member_id = request.getParameter("member_id");
		String pageNum = request.getParameter("pageNum");
		
		MemberDao md = MemberDao.getInstance();
		Member updateMem = md.idChk(member_id);
		LocationDao ld = LocationDao.getInstance();
		String location_name = ld.select(updateMem.getLocation_no());
		updateMem.setLocation_name(location_name);
		
		request.setAttribute("updateMem", updateMem);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		return "updateMemberForm";
	}
}