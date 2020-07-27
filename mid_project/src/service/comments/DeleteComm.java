package service.comments;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.CommentsDao;
public class DeleteComm implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		CommentsDao cd = CommentsDao.getInstance();
		cd.delete(comment_no);
		return "deleteComm";
	}
}
