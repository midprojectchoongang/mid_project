package service.notice;
import javax.servlet.http.*;
import dao.NoticeDao;
public class Delete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.delete(notice_no);
		request.setAttribute("result", result);
		return "delete";
	}
}