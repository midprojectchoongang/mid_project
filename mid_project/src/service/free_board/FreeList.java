package service.free_board;
import java.util.List;
import javax.servlet.http.*;
import dao.Free_boardDao;
import model.Free_board;
public class FreeList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String master_id = (String) session.getAttribute("master_id");
		// page
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		int rowPerPage = 10;
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// block
		Free_boardDao fd = Free_boardDao.getInstance();
		int total = 0;
		if (master_id == null) {
			total = fd.total(category);
		} else {
			total = fd.total_m(category);
		}
		int pagePerBlock = 10;
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		String sr = startRow + "";
		String er = endRow + "";
		List<Free_board> list = null;
		if (master_id == null) {
			list = fd.list(sr, er, category);
		} else {
			list = fd.list_m(sr, er, category);
		}
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		return "freeList";
	}
}