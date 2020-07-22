package service.free_scrap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_scrapDao;

public class ScrapChange implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		String free_noChk = free_no + "";
		
		Free_scrapDao fsd = Free_scrapDao.getInstance();
		int result = fsd.reScrap(member_id, free_noChk);	
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free_no", free_no);
		request.setAttribute("result", result);
		
		return "scrapChange";
	}

}
