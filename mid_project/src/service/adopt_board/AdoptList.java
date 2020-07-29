package service.adopt_board;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import dao.LocationDao;
import model.Adopt_board;

public class AdoptList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String master_id = (String) session.getAttribute("master_id");
		
		Adopt_boardDao ad = Adopt_boardDao.getInstance();
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
		int total = 0;
		if (master_id == null) {
		total = ad.total(member_id);
		} else {
			total = ad.total_m();
		}
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		int location_no = 0;
		String location = null;
		List<Adopt_board> list = null;
		if (master_id == null) {
			list = ad.list(startRow, endRow, member_id);
		} else {
			list = ad.list_m(startRow, endRow);
		}
		for (Adopt_board ab : list) {
			location_no = ab.getLocation_no();
			location = ld.select(location_no);
			ab.setLocation_name(location);
		}
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		return "adoptList";
	}

}
