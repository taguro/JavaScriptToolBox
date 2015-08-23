package jp.ktaguro.javaScriptToolBox;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.Query;
import com.google.appengine.api.search.QueryOptions;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;
import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class JavaScriptSearchServlet extends HttpServlet {
    private static final Index INDEX = SearchServiceFactory.getSearchService()
      .getIndex(IndexSpec.newBuilder().setName("shared_index"));
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		UserService service = UserServiceFactory.getUserService();
		req.setAttribute("isLogin", service.isUserLoggedIn()+"");

		if (service.isUserLoggedIn()&&req.getParameter("keywords")==null) {
			// login
		    String userId=service.getCurrentUser().getUserId();
			Query query = Query.newBuilder()
					.setOptions(QueryOptions.newBuilder().setLimit(30).build())
					.build("createUserId="+userId);

			Results<ScoredDocument> results = INDEX.search(query);
			req.setAttribute("results", results);
		}
		if(req.getParameter("keywords")!=null){
		    String userId=service.getCurrentUser().getUserId();
		    String word = req.getParameter("keywords").toString();
			Query query = Query.newBuilder()
					.setOptions(QueryOptions.newBuilder().setLimit(30).build())
					.build(word);

			Results<ScoredDocument> results = INDEX.search(query);
			req.setAttribute("results", results);
		}

        req.getRequestDispatcher("home.jsp").forward(req, resp);
      }

}
