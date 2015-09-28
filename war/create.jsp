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
  window.open('data:text/html,'+html,"_self")}</script>

<form id="htmlForm" accept-charset="UTF-8" action="/create" method="POST">
<% if(request.getAttribute("path")!=null) { %>
<p>共有用のリンク：<%=request.getAttribute("path") %></p>
<% } %>

<% if(request.getAttribute("count")!=null) { %>
<p><%=request.getAttribute("count")%>View</p>
<% } %>

<pre>コンテンツの概要</pre>

<textarea id="description" name="description" >
<% if(request.getAttribute("description")!=null) { %>
<%=request.getAttribute("description")%>
<% }else{ %>
/* Write description */
<% }%>
</textarea><br/>

<input type="button" value="開く" onclick="buildScript(document.getElementById('htmlForm').html.value);" />

<pre>HTMLの内容</pre>
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

<input type="button" value="開く" onclick="buildScript(document.getElementById('htmlForm').html.value);" />
<input type="submit" value="保存"/>
</form>
</body>
</html>