package service.master;
import javax.servlet.http.*;
public class LoginForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "loginForm";
	}
}