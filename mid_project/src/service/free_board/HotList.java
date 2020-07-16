package service.free_board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Free_boardDao;
import model.Free_board;

public class HotList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String category = request.getParameter("category");
		System.out.println(category+"1");
		int cnt = 5;
		Free_boardDao fd = Free_boardDao.getInstance();
		// page
		int rowPerPage = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;

		// block
		int pagePerBlock = 10;
		int total = fd.hotTotal(category, cnt);
		int totalPage = (int) Math.ceil((double) total / rowPerPage);
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		System.out.println(category+"2");
		List<Free_board> hotList = fd.hotList(startRow, endRow, category, cnt);
		System.out.println(category+"3");
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("hotList", hotList);

		return "hotList";
	}

}
