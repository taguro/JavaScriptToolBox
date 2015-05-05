package jp.ktaguro.javaScriptToolBox;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class AuthenticationFilter implements Filter{
   private static final Logger LOG = Logger.getLogger(AuthenticationFilter.class.getName());

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest _request, ServletResponse _response,
            FilterChain _chain) throws IOException, ServletException {

        UserService service = UserServiceFactory.getUserService();
        HttpServletRequest request = (HttpServletRequest)_request;
        HttpServletResponse response = (HttpServletResponse)_response;
        HttpSession session = request.getSession();
        if (service.isUserLoggedIn()){
            session.setAttribute("user", service.getCurrentUser());
            LOG.info("Login\n");
        } else {
            LOG.info("willLogin\n");
            session.removeAttribute("user");
            String url = request.getRequestURI();
            String loginurl = service.createLoginURL(url);
            response.sendRedirect(loginurl);
        }
        _chain.doFilter(request, response);

    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }


}
