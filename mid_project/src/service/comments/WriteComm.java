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
		long cur = System.currentTimeMillis();
		int tempRef = (int) (cur/1000);
		String[] cm = comm_content.split(" ");
		comm.setMember_id(member_id);
		comm.setFree_no(free_no);
		comm.setRe_step(0);
		String re_content = "";
		if (cm[0].startsWith("@")) {
			int find = Integer.parseInt(cm[0].substring(1));
			Comments orig = cd.orig(find);
			int origRef = orig.getRef();
			comm.setRef(origRef);
			comm.setRe_level(orig.getRe_level()+1);
			for (int i = 1; i < cm.length; i++) {
				re_content += cm[i]+" ";
			}
			comm.setComm_content(re_content);
		} else {
			comm.setComm_content(comm_content);
			comm.setRef(tempRef);
			comm.setRe_level(0);
		}
		
		int result = cd.write(comm);
		
		
		request.setAttribute("free_no", free_no);
		request.setAttribute("result", result);
		return "writeComm";
	}
}
