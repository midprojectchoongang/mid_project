package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Free_boardDao;
import model.Free_board;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		String member_id = request.getParameter("member_id");
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String free_image1 = "free_image1";
		String free_image2 = "free_image1";
		String free_image3 = "free_image1";
		String free_image4 = "free_image1";
		String free_image5 = "free_image1";
		
		Free_board free_board = new Free_board();
		free_board.setMember_id(member_id);
		free_board.setCategory(category);
		free_board.setSubject(subject);
		free_board.setContent(content);
		free_board.setFree_image1(free_image1);
		free_board.setFree_image2(free_image2);
		free_board.setFree_image3(free_image3);
		free_board.setFree_image4(free_image4);
		free_board.setFree_image5(free_image5);

		Free_boardDao fd = Free_boardDao.getInstance();
		int result = fd.insert(free_board);
		int free_no = fd.search(member_id);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free_no", free_no);
		request.setAttribute("result", result);
		return "write";
	}

}
