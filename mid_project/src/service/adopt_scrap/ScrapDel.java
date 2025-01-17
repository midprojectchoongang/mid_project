package service.adopt_scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_scrapDao;

public class ScrapDel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		
		Adopt_scrapDao ad = Adopt_scrapDao.getInstance();
		
		int result = ad.delete(member_id,adopt_no);
		
		request.setAttribute("result", result);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		return "scrapDel";
	}

}
