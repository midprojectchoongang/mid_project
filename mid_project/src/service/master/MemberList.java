package service.master;
import java.util.*;
import javax.servlet.http.*;

import dao.LocationDao;
import dao.MemberDao;
import model.Member;
public class MemberList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// page
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int rowPerPage = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		// block
		MemberDao md = MemberDao.getInstance();
		List<Member> list = md.list(startRow, endRow);
		LocationDao ld = LocationDao.getInstance();
		int location_no = 0;
		for (Member m : list) {
			location_no = m.getLocation_no();
			m.setLocation_name(ld.select(location_no));
		}
		int total = md.total();
		int pagePerBlock = 10;
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		return "memberList";
	}
}