package service.application;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Adopt_boardDao;
import dao.MemberDao;
import model.Adopt_board;
import model.Member;

public class WriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("member_id");
		int adopt_no = Integer.parseInt(request.getParameter("adopt_no"));
		String pageNum = request.getParameter("pageNum");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(member_id);
		
		Adopt_boardDao abd = Adopt_boardDao.getInstance();
		Adopt_board adopt = abd.read(adopt_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("member", member);
		request.setAttribute("adopt", adopt);
		
		return "writeForm";
	}

}
