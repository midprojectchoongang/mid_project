package service.master;
import javax.servlet.http.*;
import dao.MasterDao;
public class Login implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String master_id = request.getParameter("master_id");
		String password = request.getParameter("password");
		MasterDao md = MasterDao.getInstance();
		int result = md.loginChk(master_id, password);
		if (result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("master_id", master_id);
		}
		request.setAttribute("result", result);
		return "login";
	}
}