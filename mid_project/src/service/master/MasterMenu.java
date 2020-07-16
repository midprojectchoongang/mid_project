package service.master;
import javax.servlet.http.*;
public class MasterMenu implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "masterMenu";
	}
}