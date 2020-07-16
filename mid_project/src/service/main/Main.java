package service.main;
import javax.servlet.http.*;
public class Main implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "main";
	}
}