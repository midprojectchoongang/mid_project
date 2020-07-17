package service.free_scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_scrapDao;
import model.Free_scrap;

public class ScrapChk implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		Free_scrapDao fsd = Free_scrapDao.getInstance();
		List<Free_scrap> list = fsd.read(member_id);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free_no", free_no);
		request.setAttribute("list", list);
		return "scrapChk";
	}

}
