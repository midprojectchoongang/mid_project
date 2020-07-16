package service.free_scrap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;
import dao.Free_scrapDao;
import model.Free_board;
import model.Free_scrap;

public class ScrapAdd implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		Free_boardDao fd = Free_boardDao.getInstance();
		Free_board free = fd.read(free_no);
		
		Free_scrapDao fsd = Free_scrapDao.getInstance();
		Free_scrap free_scrap = new Free_scrap();
		
		free_scrap.setMember_id(member_id);
		free_scrap.setFree_no(free_no);
		free_scrap.setSubject(free.getSubject());
			
		int	result = fsd.scrap(free_scrap);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free_no", free_no);
		request.setAttribute("result", result);
		
		return "scrapAdd";
	}

}
