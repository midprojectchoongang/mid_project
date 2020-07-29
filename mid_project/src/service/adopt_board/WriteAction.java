package service.adopt_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import model.Adopt_board;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		String largecate_id = request.getParameter("largecate_id"); 
		String smallcate_id = request.getParameter("smallcate_id");
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		Adopt_board adopt_board = new Adopt_board();
		adopt_board.setMember_id(member_id);
		adopt_board.setLargecate_id(largecate_id);
		adopt_board.setSmallcate_id(smallcate_id);
		adopt_board.setLocation_no(location_no);
		adopt_board.setSubject(subject);

			
		Adopt_boardDao ad = Adopt_boardDao.getInstance();
		int result = ad.insert(adopt_board);
		int adopt_no = ad.search(member_id);
		System.out.println(adopt_no);
		ad.writeImg(content, adopt_no);
				
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);		
		return "write";
	}

}
