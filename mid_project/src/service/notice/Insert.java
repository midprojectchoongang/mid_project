package service.notice;
import javax.servlet.http.*;
import dao.NoticeDao;
import model.Notice;
public class Insert implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		Notice notice = new Notice();
		notice.setSubject(subject);
		notice.setContent(content);
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.insert(notice);
		request.setAttribute("result", result);
		return "insert";
	}
}