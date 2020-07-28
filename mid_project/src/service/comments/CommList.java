package service.comments;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDao;
import dao.Free_boardDao;
import model.Comments;

public class CommList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String c_pageNum = request.getParameter("c_pageNum");
		String member_id = (String) session.getAttribute("member_id");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		int rowPerPage = 10;
		if (c_pageNum == null || c_pageNum.equals(""))
			c_pageNum = "1";
		int currentPage = Integer.parseInt(c_pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// block
		CommentsDao cd = CommentsDao.getInstance();
		int total = cd.total(free_no);
		int pagePerBlock = 10;
		int totalPage = (int)Math.ceil((double)total/rowPerPage);
		int startPage = currentPage - (currentPage-1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		
		List<Comments> commList = cd.list(startRow,endRow,free_no);  
		
		if(commList == null) System.out.println("no list");
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("c_pageNum", c_pageNum);
		request.setAttribute("member_id", member_id);
		request.setAttribute("commList", commList);
		request.setAttribute("free_no", free_no);
		return "commList";
	}
}
