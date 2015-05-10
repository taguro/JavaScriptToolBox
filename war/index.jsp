<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
      <a href="/home"><img class="icon" src="home.png"></a>
      <a href="/create" target="mainframe"><img class="icon" src="add.png"></a>
      <a href="#" onclick="window.setTimeout( 'showToolTip()', 10 );"><img class="icon" src="setting.png"></a>
      <div id="menutooltip" style="display:none"><a href="/logout">ログアウト</a></div>
      <form name="searchform" class="searchform" method="get" action="#">
        <input name="keywords" class="keywords" value="" type="text">
        <input src="search.png" alt="検索" name="searchBtn" class="searchBtn" type="image">
      </form>
    </div>
    <div class="cell">
      <span class="cellword">Title</span>
      <div class="miniicons"><img class="miniicon" src="setting.png"></div>
    </div>
    <div class="cell">
      <span class="cellword">Title</span>
      <div class="miniicons"><img class="miniicon" src="add.png"><img class="miniicon" src="setting.png"></div>
    </div>
    <div class="cell">
      <span class="cellword greyout">Title</span>
      <div class="miniicons"><img class="miniicon" src="add.png"><img class="miniicon" src="setting.png"></div>
    </div>
  </div>
  <iframe src="/create" class="mainframe" name="mainframe"></iframe>
</body>
</html>