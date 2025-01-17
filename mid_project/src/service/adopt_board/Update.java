package service.adopt_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import model.Adopt_board;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		Adopt_boardDao ad = Adopt_boardDao.getInstance();
		Adopt_board adopt = new Adopt_board();
		
		adopt.setMember_id(member_id);;
		adopt.setAdopt_no(adopt_no);
		adopt.setLocation_no(location_no);
		adopt.setSubject(subject);
		
		int result = ad.update(adopt);
		ad.writeImg(content, adopt_no);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("adopt", adopt);
		request.setAttribute("result", result);
				
		return "update";
	}

}
