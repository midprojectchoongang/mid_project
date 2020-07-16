package service.free_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Free_boardDao;
import model.Free_board;

public class InsertFree implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Free_boardDao fd = Free_boardDao.getInstance();
		
		int result = 0;
		for (int i = 2; i <= 325; i++) {
			Free_board free = new Free_board();
			free.setFree_no(i);
			free.setMember_id("test");
			if (i % 3 == 0)	free.setCategory("f");
			else if (i % 3 == 1 ) free.setCategory("i");
			else free.setCategory("a");
			free.setSubject("test"+i);
			free.setContent("test content");
			free.setFree_image1("free_image1");
			free.setFree_image2("free_image1");
			free.setFree_image3("free_image1");
			free.setFree_image4("free_image1");
			free.setFree_image5("free_image1");
			result = fd.insert(free);
			
		}
		
		request.setAttribute("result", result);
		return "insert";
	}

}
