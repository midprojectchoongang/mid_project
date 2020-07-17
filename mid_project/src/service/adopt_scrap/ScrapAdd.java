package service.adopt_scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import dao.Adopt_scrapDao;
import model.Adopt_board;
import model.Adopt_scrap;

public class ScrapAdd implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		

		Adopt_boardDao ad = Adopt_boardDao.getInstance();
		Adopt_board adopt = ad.read(adopt_no);
		
		Adopt_scrapDao asd = Adopt_scrapDao.getInstance();
		Adopt_scrap adopt_scrap = new Adopt_scrap();
		
		adopt_scrap.setMember_id(member_id);
		adopt_scrap.setAdopt_no(adopt_no);
		adopt_scrap.setLargecate_id(adopt.getLargecate_id());
		adopt_scrap.setSmallcate_id(adopt.getSmallcate_id());
		adopt_scrap.setLocation_no(adopt.getLocation_no());
		adopt_scrap.setSubject(adopt.getSubject());
					
		int	result = asd.scrap(adopt_scrap);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("adopt_no", adopt_no);
		request.setAttribute("result", result);
		
		return "scrapAdd";
	}

}
