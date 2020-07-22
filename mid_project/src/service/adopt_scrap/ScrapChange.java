package service.adopt_scrap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_scrapDao;

public class ScrapChange implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		String adopt_noChk = adopt_no + "";
		
		Adopt_scrapDao asd = Adopt_scrapDao.getInstance();
		int result = asd.reScrap(member_id, adopt_noChk);	
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("adopt_no", adopt_no);
		request.setAttribute("result", result);
		
		return "scrapChange";
	}

}
