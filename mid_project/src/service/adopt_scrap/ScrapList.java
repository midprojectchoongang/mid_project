package service.adopt_scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_scrapDao;
import dao.LocationDao;
import model.Adopt_board;
import model.Adopt_scrap;

public class ScrapList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		Adopt_scrapDao asd = Adopt_scrapDao.getInstance();
		LocationDao ld = LocationDao.getInstance();
		
		// page
		int rowPerPage = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
				
		// block
		int pagePerBlock = 10;
		int total = asd.total(member_id);
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		int location_no = 0;
		String location = null;
		List<Adopt_scrap> list = asd.list(startRow, endRow, member_id);
		for (Adopt_scrap as : list) {
			location_no = as.getLocation_no();
			location = ld.select(location_no);
			as.setLocation_name(location);
		}
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		
		return "scrapList";
	}

}
