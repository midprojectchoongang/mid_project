package service.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentsDao;
import model.Comments;

public class UpdateComm implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String comm_content = request.getParameter("comm_content");
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		
		CommentsDao cd = CommentsDao.getInstance();
		Comments comm = new Comments();
		
		comm.setComm_content(comm_content);
		comm.setComment_no(comment_no);
		
		int result = cd.update(comm);
		
		request.setAttribute("result", result);
		return "updateComm";
	}
}
