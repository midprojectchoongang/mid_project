package service.notice;
import javax.servlet.http.*;
import dao.NoticeDao;
import model.Notice;
public class Update implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Notice notice = new Notice();
		notice.setNotice_no(notice_no);
		notice.setSubject(subject);
		notice.setContent(content);
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.update(notice);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice_no", notice_no);
		request.setAttribute("result", result);
		return "update";
	}
}