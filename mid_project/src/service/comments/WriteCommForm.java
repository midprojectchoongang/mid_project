package service.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDao;
import dao.Free_boardDao;
import model.Comments;

public class WriteCommForm implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		return "writeCommForm";
	}
}
