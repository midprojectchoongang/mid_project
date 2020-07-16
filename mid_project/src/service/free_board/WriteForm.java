package service.free_board;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class WriteForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		request.setAttribute("category", category);
		return "writeForm";
	}
}