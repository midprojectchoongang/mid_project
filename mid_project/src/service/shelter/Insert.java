package service.shelter;
import javax.servlet.http.*;

import dao.LocationDao;
import dao.ShelterDao;
import model.Location;
import model.Shelter;
public class Insert implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int location_no = Integer.parseInt(request.getParameter("location_no"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");	
		Shelter shelter = new Shelter();
		shelter.setLocation_no(location_no);
		shelter.setName(name);
		shelter.setTel(tel);
		ShelterDao sd = ShelterDao.getInstance();
		int result = sd.insert(shelter);
		request.setAttribute("result", result);
		return "insert";
	}
}