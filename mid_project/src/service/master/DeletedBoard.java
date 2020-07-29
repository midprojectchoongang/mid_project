package service.master;
import javax.servlet.http.*;
public class DeletedBoard implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "deletedBoard";
	}
}