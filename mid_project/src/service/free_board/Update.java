package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;
import model.Free_board;

public class Update implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		String category = request.getParameter("category");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		Free_boardDao fd = Free_boardDao.getInstance();
		
		Free_board free = new Free_board();
		free.setFree_no(free_no);
		free.setMember_id(member_id);
		free.setCategory(category);
		free.setSubject(subject);
		// free.setContent(content);
		
		
		  System.out.println(free_no); 
		  System.out.println(category);
		  System.out.println(subject);
		 
		 System.out.println(content);
		int result = fd.update(free);
		fd.writeImg(content, free_no);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free", free);
		request.setAttribute("result", result);
				
		return "update";
	}

}
