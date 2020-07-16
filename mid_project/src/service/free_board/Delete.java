package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));

		Free_boardDao fd = Free_boardDao.getInstance();
		int result = fd.delete(free_no);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free_no", free_no);	
		request.setAttribute("result", result);	
		
		return "delete";
	}

}
