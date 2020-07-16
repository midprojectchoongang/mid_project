package service.free_scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_scrapDao;

public class ScrapDel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		Free_scrapDao fd = Free_scrapDao.getInstance();
		
		int result = fd.delete(member_id,free_no);

		request.setAttribute("result", result);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		return "scrapDel";
	}

}
