package service.adopt_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import model.Adopt_board;

public class AdoptContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		String category = request.getParameter("category");
		
		Adopt_boardDao ad = Adopt_boardDao.getInstance();
		Adopt_board adopt = ad.read(adopt_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("adopt", adopt);
		return "adoptContent";
	}

}
