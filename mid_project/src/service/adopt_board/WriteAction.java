package service.adopt_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Adopt_boardDao;
import model.Adopt_board;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		String member_id = request.getParameter("member_id");
		
		String largecate_id = request.getParameter("largecate_id"); 
		String smallcate_id = request.getParameter("smallcate_id");
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		 
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String adopt_image1 = "adopt_image1"; 
		String adopt_image2 = "adopt_image2";
		String adopt_image3 = "adopt_image3"; 	
		String adopt_image4 = "adopt_image4";
		String adopt_image5 = "adopt_image5";

		Adopt_board adopt_board = new Adopt_board();
		adopt_board.setMember_id(member_id);

		adopt_board.setLargecate_id(largecate_id);
		adopt_board.setSmallcate_id(smallcate_id);
		adopt_board.setLocation_no(location_no);
		
		adopt_board.setSubject(subject);
		adopt_board.setContent(content);

		adopt_board.setAdopt_image1(adopt_image1);
		adopt_board.setAdopt_image2(adopt_image2);
		adopt_board.setAdopt_image3(adopt_image3);
		adopt_board.setAdopt_image4(adopt_image4);
		adopt_board.setAdopt_image5(adopt_image5);
			
		Adopt_boardDao ad = Adopt_boardDao.getInstance();
		int result = ad.insert(adopt_board);
		//int adopt_no = ad.search(member_id);
				
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);		
		return "write";
	}

}
