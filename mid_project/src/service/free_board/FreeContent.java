package service.free_board;
import javax.servlet.http.*;
import dao.Free_boardDao;
import model.Free_board;
public class FreeContent implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		String pageNum = request.getParameter("pageNum");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		
		Free_boardDao fd = Free_boardDao.getInstance();
		Free_board free = fd.read(free_no);
		
		if(member_id.equals(free.getMember_id())) {}
		else {
			fd.cntUp(free_no);
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("free", free);
		
		return "freeContent";
	}
}