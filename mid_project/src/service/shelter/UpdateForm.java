package service.shelter;
import javax.servlet.http.*;
import dao.ShelterDao;
import model.Shelter;
public class UpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int shelter_no = Integer.parseInt(request.getParameter("shelter_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		ShelterDao sd = ShelterDao.getInstance();
		Shelter shelter = sd.select(shelter_no);
		request.setAttribute("shelter", shelter);
		request.setAttribute("pageNum", pageNum);
		return "updateForm";
	}
}