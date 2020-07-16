package controller;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import service.master.CommandProcess;
@WebServlet(urlPatterns="*.master", initParams={
				@WebInitParam(name="config", value="/WEB-INF/master.properties")})
public class MasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<>();
	public void init(ServletConfig config) throws ServletException { 
	   	String props = config.getInitParameter("config");
	   	Properties pr = new Properties();
	    FileInputStream fis = null;
	    try {
	          String configFilePath = config.getServletContext().getRealPath(props);
	          fis = new FileInputStream(configFilePath);
	          pr.load(fis);
	    } catch (IOException e) { 
	    	throw new ServletException(e);
	    } finally {
	          if (fis != null) {
	        	  try { fis.close();
	        	  } catch(IOException ex) {
	        		  System.out.println("ERROR: " + ex.getMessage());
	        	  }
	          }
	     }
	     Iterator<Object> keyIter = pr.keySet().iterator();
	     while( keyIter.hasNext() ) {
	          String command = (String)keyIter.next(); 
	          String className = pr.getProperty(command); 
	          try {
	               Class<?> commandClass=Class.forName(className);
	               Object commandInstance=commandClass.newInstance();
	               commandMap.put(command, commandInstance);
	          } catch (Exception e) {
	               throw new ServletException(e);
	          }
	     }
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		String view = null;
	    CommandProcess cmdp = null;
	    try { 
	    	  String command = request.getRequestURI();
		      command = command.substring(request.getContextPath().length() + 1); 
		      cmdp = (CommandProcess)commandMap.get(command); 
	          view = cmdp.requestPro(request, response);
	   } catch(Throwable e) {
		   throw new ServletException(e); 
	   } 
	   RequestDispatcher rd =
	      	request.getRequestDispatcher("/WEB-INF/mate/master/" + view + ".jsp");
	   rd.forward(request, response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
    		request.setCharacterEncoding("utf-8");
    		doGet(request, response);
	}
}