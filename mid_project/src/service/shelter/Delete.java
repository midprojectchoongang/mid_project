package service.shelter;
import javax.servlet.http.*;
import dao.ShelterDao;
public class Delete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int shelter_no = Integer.parseInt(request.getParameter("shelter_no"));
		ShelterDao sd = ShelterDao.getInstance();
		int result = sd.delete(shelter_no);
		request.setAttribute("result", result);
		return "delete";
	}
}