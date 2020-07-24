package service.comments;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDao;
import model.Comments;

public class CommList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		CommentsDao cd = CommentsDao.getInstance();
		List<Comments> commList = cd.list(free_no);  
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("commList", commList);
		request.setAttribute("free_no", free_no);
		return "commList";
	}
}
