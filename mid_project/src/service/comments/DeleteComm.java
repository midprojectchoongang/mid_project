package service.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentsDao;
import model.Comments;

public class DeleteComm implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		
		CommentsDao cd = CommentsDao.getInstance();
		int result = cd.delete(comment_no);
		
		request.setAttribute("result", result);
		return "deleteComm";
	}
}
