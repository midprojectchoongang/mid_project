package service.notice;
import java.util.List;
import javax.servlet.http.*;
import dao.NoticeDao;
import model.Notice;
public class NoticeList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// page
		String pageNum = request.getParameter("pageNum");
		int rowPerPage = 10;
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;		
		// block
		NoticeDao nd = NoticeDao.getInstance();
		int total = nd.total();
		int pagePerBlock = 10;
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		List<Notice> list = nd.list(startRow, endRow);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("list", list);
		return "noticeList";
	}
}