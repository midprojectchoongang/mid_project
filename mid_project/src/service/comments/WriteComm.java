package service.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDao;
import model.Comments;

public class WriteComm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		int free_no = Integer.parseInt(request.getParameter("free_no"));
		String comm_content = request.getParameter("comm_content");
		
		CommentsDao cd = CommentsDao.getInstance();
		Comments comm = new Comments();
		
		
		comm.setMember_id(member_id);
		comm.setFree_no(free_no);
		comm.setComm_content(comm_content);
		comm.setRef(0);
		comm.setRe_step(0);
		comm.setRe_level(0);
		
		int result = cd.write(comm);
		
		
		request.setAttribute("free_no", free_no);
		request.setAttribute("result", result);
		return "writeComm";
	}
}
