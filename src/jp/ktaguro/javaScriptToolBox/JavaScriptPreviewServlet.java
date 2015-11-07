package jp.ktaguro.javaScriptToolBox;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.SearchServiceFactory;

public class JavaScriptPreviewServlet extends HttpServlet {
    private static final Index INDEX = SearchServiceFactory.getSearchService()
      .getIndex(IndexSpec.newBuilder().setName("shared_index"));

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    		throws IOException, ServletException {
    	String html=req.getParameter("previewHtml");
    	req.setAttribute("html", html);

    	req.getRequestDispatcher("preview.jsp").forward(req, resp);
    }

}