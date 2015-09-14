package jp.ktaguro.javaScriptToolBox;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.search.Document;
import com.google.appengine.api.search.Field;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.Query;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;
import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class JavaScriptCreateServlet extends HttpServlet {
    private static final Index INDEX = SearchServiceFactory.getSearchService()
      .getIndex(IndexSpec.newBuilder().setName("shared_index"));

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws IOException, ServletException {
  	    String docId = req.getParameter("docId");
  	    Query query= Query.newBuilder().build("Id="+docId);
  		Results<ScoredDocument> results = INDEX.search(query);
  		req.setAttribute("results", results);

          req.getRequestDispatcher("create.jsp").forward(req, resp);
        }
    
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
		  throws IOException, ServletException {

      String title=req.getParameter("title");
      String description=req.getParameter("description");
      String css=req.getParameter("css");
      String js=req.getParameter("js");
      String tag=req.getParameter("tag");


	  Document.Builder docBuilder=Document.newBuilder()
			  .addField(Field.newBuilder().setName("title").setText(title))
			  .addField(Field.newBuilder().setName("description").setText(description))
			  .addField(Field.newBuilder().setName("css").setText(css))
			  .addField(Field.newBuilder().setName("js").setText(js))
			  .addField(Field.newBuilder().setName("tag").setText(tag))
			  .addField(Field.newBuilder().setName("published").setDate(new Date()));

	    Document doc = docBuilder.build();

	    try {
	      INDEX.put(doc);
	    } catch (RuntimeException e) {
	    	//ignore
	    }
        req.getRequestDispatcher("create.jsp").forward(req, resp);
  }


}