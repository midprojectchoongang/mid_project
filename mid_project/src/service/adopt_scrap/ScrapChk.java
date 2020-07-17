package service.adopt_scrap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_scrapDao;
import model.Adopt_scrap;

public class ScrapChk implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));		
		
		Adopt_scrapDao asd = Adopt_scrapDao.getInstance();
		List<Adopt_scrap> list = asd.read(member_id);

		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("adopt_no", adopt_no);

		request.setAttribute("list", list);
		
		return "scrapChk";
	}

}
