package service.application;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ApplicationDao;
import dao.Free_boardDao;
import dao.LocationDao;
import model.Application;
import model.Free_board;

public class MyAppList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		
		int rowPerPage = 10;
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// block
		ApplicationDao ad = ApplicationDao.getInstance();
		int total = ad.total(member_id);
		int pagePerBlock = 10;
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		String sr = startRow + "";
		String er = endRow + "";

		LocationDao ld = LocationDao.getInstance();
		int location_no = 0;
		String location = null;
		List<Application> list = ad.list(sr, er, member_id);
		for (Application ac : list) {
			location_no = ac.getLocation_no();
			location = ld.select(location_no);
			ac.setLocation_name(location);
		}
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("member_id", member_id);
		request.setAttribute("list", list);
		
		return "myAppList";
	}

}
