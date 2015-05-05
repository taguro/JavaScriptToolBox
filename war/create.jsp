<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <title>BrowserJSEditor</title>
  <meta charset="UTF-8">
</head>
<body>
create
<body>
<script language="JavaScript">
function buildScript(css,js,tag) {
  js=js.split(/\/\/.*\n/).join("");
  window.open('data:text/html, <!DOCTYPE html><html lang="ja"><head><title>BrowserJSEditor</title><meta charset="UTF-8"><style type="text/css">'+css+'</style><script language="javascript">'+js+'<\/script></head><body>'+tag+'</body></html>')}</script>

<pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="ja"&gt;
&lt;head&gt;
  &lt;title&gt;BrowserJSEditor&lt;/title&gt;
  &lt;meta charset="UTF-8"&gt;
  &lt;style  type="text/css"&gt;
</pre>

<form id="editor" accept-charset="UTF-8" action="/run" method="GET" onsubmit="buildScript(this.css.value,this.js.value,this.tag.value);return false;">
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
<input type="submit" value="Build"/>
</form>
</body>
</html>