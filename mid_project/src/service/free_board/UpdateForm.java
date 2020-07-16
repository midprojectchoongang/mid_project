package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Free_boardDao;
import model.Free_board;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		Free_boardDao fd = Free_boardDao.getInstance();
		Free_board free = fd.read(free_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free", free);
		
		return "updateForm";
	}

}
