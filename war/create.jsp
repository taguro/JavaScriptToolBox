<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <title>BrowserJSEditor</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="jseditor.css">
</head>
<body>
create
<body>
<script language="JavaScript">
function buildScript(title,css,js,tag) {
  js=js.split(/\/\/.*\n/).join("");
  window.open('data:text/html, <!DOCTYPE html><html lang="ja"><head><title>'+title+'</title><meta charset="UTF-8"><style type="text/css">'+css+'</style><script language="javascript">'+js+'<\/script></head><body>'+tag+'</body></html>',"_self")}</script>

<form id="htmlForm" accept-charset="UTF-8" action="/create" method="POST">
<pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="ja"&gt;
&lt;head&gt;
  &lt;title&gt;</pre>
<textarea name="title" >
Write Title
</textarea>
<pre>
  &lt;/title&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;!--
</pre>

<textarea name="description" >
/* Write description */

</textarea>

<pre>
  --&gt;
  &lt;style  type="text/css"&gt;
</pre>

<textarea name="css" >
/* Write CSS */

</textarea>

<pre>
  &lt;/style&gt;
  &lt;script language="JavaScript"&gt;


</pre>
<textarea name="js" >
//Write Script
  function doScript(val){javascript:alert(val);}

</textarea>
<pre>
  &lt;/script&gt;
&lt;/head&gt;
&lt;body&gt;
</pre>

<textarea name="tag" >
<!-- Write Tag -->
&lt;form id="editor" action="/run" method="GET" onsubmit="doScript(this.val.value);return false;"&gt;
&lt;textarea name="val" &gt; value&lt;/textarea&gt;
&lt;input type="submit" value="DoScript"/&gt;
&lt;/form&gt;

</textarea>
<pre>
&lt;/body&gt;
&lt;/html&gt;
</pre>
<input type="button" value="run" onclick="buildScript(document.getElementById('htmlForm').title.value,document.getElementById('htmlForm').css.value,document.getElementById('htmlForm').js.value,document.getElementById('htmlForm').tag.value);" />
<input type="submit" value="save"/>
</form>
</body>
</html>