package service.notice;
import javax.servlet.http.*;
import dao.NoticeDao;
import model.Notice;
public class UpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice = nd.select(notice_no);
		request.setAttribute("notice", notice);
		request.setAttribute("pageNum", pageNum);
		return "updateForm";
	}
}