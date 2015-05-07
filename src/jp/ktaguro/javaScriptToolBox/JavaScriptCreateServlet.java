package jp.ktaguro.javaScriptToolBox;

import java.io.IOException;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.search.Document;
import com.google.appengine.api.search.Field;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class JavaScriptCreateServlet extends HttpServlet {
    private static final Index INDEX = SearchServiceFactory.getSearchService()
      .getIndex(IndexSpec.newBuilder().setName("shared_index"));
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {
        req.getRequestDispatcher("create.jsp").forward(req, resp);
      }
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp){
      UserService service = UserServiceFactory.getUserService();
      String userId=service.getCurrentUser().getUserId();
      String css=req.getParameter("css");
      String js=req.getParameter("js");
      String tag=req.getParameter("tag");


	  Document.Builder docBuilder=Document.newBuilder()
			  .addField(Field.newBuilder().setName("createUserId").setText(userId))
			  .addField(Field.newBuilder().setName("css").setText(css))
			  .addField(Field.newBuilder().setName("js").setText(js))
			  .addField(Field.newBuilder().setName("tag").setText(tag))
			  .addField(Field.newBuilder().setName("published").setDate(new Date()));
	    String tagStr = req.getParameter("tags");

	    if (tagStr != null) {
	      StringTokenizer tokenizer = new StringTokenizer(tagStr, ",");
	      while (tokenizer.hasMoreTokens()) {
	        docBuilder.addField(Field.newBuilder().setName("tag")
	            .setAtom(tokenizer.nextToken()));
	      }
	    }

	    Document doc = docBuilder.build();

	    try {
	      INDEX.put(doc);
	    } catch (RuntimeException e) {
	    	//ignore
	    }
  }


}