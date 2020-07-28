package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;
import model.Free_board;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Free_board free_board = new Free_board();
		free_board.setMember_id(member_id);
		free_board.setCategory(category);
		free_board.setSubject(subject);

		Free_boardDao fd = Free_boardDao.getInstance();
		int result = fd.insert(free_board);
		int free_no = fd.search(member_id);
		fd.writeImg(content, free_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("result", result);
		return "write";
	}

}
