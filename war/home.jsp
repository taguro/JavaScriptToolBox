<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="ja">
<head>
  <title>BrowserJSEditor</title>
  <meta charset="UTF-8">
</head>
  <%=(String)request.getAttribute("error")%><br/>
  <a href="/create">ツールを作成する</a><br/>
  <a href="/logout">ログアウト</a><br/>
</html>