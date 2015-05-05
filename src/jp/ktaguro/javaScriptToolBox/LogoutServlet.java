package jp.ktaguro.javaScriptToolBox;

import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
        UserService service = UserServiceFactory.getUserService();
        String logouturl = service.createLogoutURL("/logout.html");
        resp.sendRedirect(logouturl);
  }
  

  
  
}
