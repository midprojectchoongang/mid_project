package service.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import dao.Adopt_boardDao;
import dao.ApplicationDao;
import dao.LocationDao;
import model.Adopt_board;
import model.Application;

public class AppContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int application_no = Integer.parseInt(request.getParameter("application_no"));
		
		ApplicationDao ad = ApplicationDao.getInstance();
		Application apply = ad.read(application_no);
		int appliedBoard = ad.getNo(application_no);
		
		Adopt_boardDao abd = Adopt_boardDao.getInstance();
		Adopt_board adopt = abd.read(appliedBoard);
		
		LocationDao ld = LocationDao.getInstance();
		String location_name = ld.select(apply.getLocation_no());
		String location_name2 = ld.select(adopt.getLocation_no());
		
		request.setAttribute("adopt", adopt);
		request.setAttribute("member_id", member_id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("location_name", location_name);
		request.setAttribute("location_name2", location_name2);
		request.setAttribute("apply", apply);
		
		return "appContent";
	}

}
