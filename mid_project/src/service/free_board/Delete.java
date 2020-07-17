package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;
import model.Free_board;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		int free_no = Integer.parseInt(request.getParameter("free_no"));

		Free_boardDao fd = Free_boardDao.getInstance();
		int result = fd.delete(free_no);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free_no", free_no);	
		request.setAttribute("category", category);	
		request.setAttribute("result", result);	
		
		return "delete";
	}

}