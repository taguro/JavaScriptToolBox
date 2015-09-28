package jp.ktaguro.javaScriptToolBox;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.SearchServiceFactory;

public class JavaScriptCreateServlet extends HttpServlet {
    private static final Index INDEX = SearchServiceFactory.getSearchService()
      .getIndex(IndexSpec.newBuilder().setName("shared_index"));

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws IOException, ServletException {
    	String id = req.getParameter("id");
    	if(id!=null){
    		long id_long = Long.valueOf(id);

    		DatastoreService datastoreService = DatastoreServiceFactory.getDatastoreService();

    		Key key = KeyFactory.createKey("htmlFile", id_long);

    		try {
    			Entity result=datastoreService.get(key);
    			long count = (long)result.getProperty("count")+1;
    			result.setProperty("count", count);
    			datastoreService.put(result);


    			String html = (String) result.getProperty("html");
    			html = StringEscapeUtils.escapeHtml3(html);

    			String description = (String) result.getProperty("description");
    			description = StringEscapeUtils.escapeHtml3(description);

    			req.setAttribute("html", html);
    			req.setAttribute("description", description);
    			req.setAttribute("count", count);

    		} catch (EntityNotFoundException e) {
    			//ignore
    		}
    	}

    	req.getRequestDispatcher("create.jsp").forward(req, resp);
    }

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
		  throws IOException, ServletException {

      String html=req.getParameter("html");
      String description=req.getParameter("description");


      DatastoreService datastoreService = DatastoreServiceFactory.getDatastoreService();
      Entity entity = new Entity("htmlFile");
      entity.setProperty("html", html);
      entity.setProperty("description", description);//説明
      entity.setProperty("count", 0);//表示回数
      Key key = datastoreService.put(entity);

      String path = new String(req.getRequestURL())+"?id="+key.getId();
      req.setAttribute("path", path);
      req.getRequestDispatcher("create.jsp").forward(req, resp);
  }


}