package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;
import model.Free_board;

public class HotContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String master_id = (String)session.getAttribute("master_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		Free_boardDao fd = Free_boardDao.getInstance();
		Free_board free = fd.read(free_no);
		
		if (member_id == null) {
			if (master_id == null) {				
				fd.cntUp(free_no);
			} else {}
		} else if (member_id.equals(free.getMember_id())) {	
		} else {
			fd.cntUp(free_no);
		}
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free", free);
		return "hotContent";
	}

}
