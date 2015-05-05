<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <title>BrowserJSEditor</title>
  <meta charset="UTF-8">
  <style type="text/css">
    <%=(String)request.getAttribute("css")%>
  </style>
  <script language="javascript">
    <%=(String)request.getAttribute("js")%>
  </script>
</head>
<body>
<%=(String)request.getAttribute("tag")%>
  
</body>
</html>