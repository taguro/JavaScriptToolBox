<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <title>BrowserJSEditor</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="jseditor.css">
</head>
<body>
<body>
<script language="JavaScript">
function buildScript(html) {
  html=html.split(/\/\/.*\n/).join("");
  window.open('data:text/html,'+html,"_self")
}
function beforePreview() {
	document.getElementById('previewHtml').value=document.getElementById('htmlForm').html.value;
}

</script>

<% if(request.getAttribute("path")!=null) { %>
<p>共有用のリンク：<%=request.getAttribute("path") %></p>
<% } %>

<% if(request.getAttribute("count")!=null) { %>
<p><%=request.getAttribute("count")%>View</p>
<% } %>

<p>このページは、手軽にJavascriptを実行して共有するためのWebページです</p>
<form id="previewForm" accept-charset="UTF-8" action="/preview" method="GET">
<input type="hidden" id="previewHtml" name="previewHtml"/>
<input type="submit" value="Webページを開く" onclick="beforePreview()" />
</form>

<form id="htmlForm" accept-charset="UTF-8" action="/create" method="POST">
<h1>Webページの概要</h1>

<textarea id="description" name="description" >
<% if(request.getAttribute("description")!=null) { %>
<%=request.getAttribute("description")%>
<% }else{ %>
/* Write description */
<% }%>
</textarea><br/>

<h1>Webページの内容</h1>
<textarea id="html" name="html" >
<% if(request.getAttribute("html")!=null) { %>
<%=request.getAttribute("html")%>
<% }else{ %>
&lt;!DOCTYPE html&gt;
&lt;html lang="ja"&gt;
&lt;head&gt;
  &lt;title&gt;

  Write Title

  &lt;/title&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;style  type="text/css"&gt;

  /* Write CSS (you can't use an id selector because of a sharp character) */
  .val {border-radius: 20px;}

  &lt;/style&gt;
  &lt;script language="JavaScript"&gt;

  /* Write Script */

  function doScript(val){javascript:alert(val);}

  &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;

&lt;!-- Write Tag --&gt;

&lt;form id="editor" action="/run" method="GET" onsubmit="doScript(this.val.value);return false;"&gt;
&lt;textarea name="val" class="val" &gt; value&lt;/textarea&gt;
&lt;input type="submit" value="DoScript"/&gt;
&lt;/form&gt;


&lt;/body&gt;
&lt;/html&gt;

<% }%>
</textarea><br/>

<input type="button" value="お気に入りに保存できる形式で開く" onclick="buildScript(document.getElementById('htmlForm').html.value);" />
<input type="submit" value="共有"/>
</form>



<p>注:「お気に入りに保存できる形式で開く」では、HTMLの内容に1行コメントと#は利用できないようです</p>
<a class="twitter-timeline"  href="https://twitter.com/hashtag/JavaScriptToolBox" data-widget-id="648484842452070400">#JavaScriptToolBox のツイート</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

</body>
</html>