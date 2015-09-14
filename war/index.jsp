<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.google.appengine.api.search.*" %>
<%@ page import="com.google.appengine.api.search.Index" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <title>BrowserJSEditor</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="jseditor.css">
</head>
<script>
document.onclick = function (e){
  document.getElementById('menutooltip').style.display='none';
};
function showToolTip(){
document.getElementById('menutooltip').style.display='inline';
document.getElementById('menutooltip').style.top='30px';

return false;
}
</script>
<body>
  <div id="menubar">
    <div class="cell menucell">
      <form name="searchform" class="searchform" method="get" action="#">
        <input name="keywords" class="keywords" value="" type="text">
        <input src="search.png" alt="検索" name="searchBtn" class="searchBtn" type="image">
      </form>
    </div>
		<%
			String word = request.getParameter("keywords");
			Query query = Query.newBuilder()
					.setOptions(QueryOptions.newBuilder().setLimit(30).build())
					.build(word == null ? "" : word);

			Index INDEX = SearchServiceFactory.getSearchService().getIndex(
					IndexSpec.newBuilder().setName("shared_index"));

			Results<ScoredDocument> results = INDEX.search(query);

			if (results != null) {
				for (Document doc : results) {
					out.println("<div class='cell'>");
					out.println("<span class='cellword'>");
					out.println(doc.getOnlyField("title").getText());
					out.println("</span>");
					out.println("</div>");
				}
			}
		%>
		<%
//    <div class="cell">
//      <span class="cellword">Title</span>
//      <div class="miniicons"><img class="miniicon" src="setting.png"></div>
//    </div>
//    <div class="cell">
//      <span class="cellword">Title</span>
//      <div class="miniicons"><img class="miniicon" src="add.png"><img class="miniicon" src="setting.png"></div>
//    </div>
//    <div class="cell">
//      <span class="cellword greyout">Title</span>
//      <div class="miniicons"><img class="miniicon" src="add.png"><img class="miniicon" src="setting.png"></div>
//    </div>
    %>
  </div>
  <iframe src="/create" class="mainframe" name="mainframe"></iframe>
</body>
</html>