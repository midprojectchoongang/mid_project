package service.notice;
import javax.servlet.http.*;
public interface CommandProcess {
	String requestPro(HttpServletRequest request, HttpServletResponse response);
}