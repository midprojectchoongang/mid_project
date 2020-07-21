package service.shelter;
import javax.servlet.http.*;
import dao.ShelterDao;
import model.Shelter;
public class Update implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		int shelter_no = Integer.parseInt(request.getParameter("shelter_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		Shelter shelter = new Shelter();
		shelter.setShelter_no(shelter_no);
		shelter.setLocation_no(location_no);
		shelter.setName(name);
		shelter.setTel(tel);
		ShelterDao sd = ShelterDao.getInstance();
		int result = sd.update(shelter);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("shelter_no", shelter_no);
		request.setAttribute("result", result);
		return "update";
	}
}