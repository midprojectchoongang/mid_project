package service.shelter;
import javax.servlet.http.*;
public class InsertForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "insertForm";
	}
}