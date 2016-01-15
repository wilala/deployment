<html lang="zh_cn">
<meta charset="gbk" />
<title>Deployment </title>

<head>
<style type="text/css">
div#container{width:1500px}
div#header {background-color:#99bbbb;}
div#package {background-color:#ffff99;height:400px;width:30%;float:left;}
div#target {background-color:#EEEEEE;height:400px;width:40%;float:left;}
div#footer {background-color:#99bbbb;clear:both;text-align:center;}
h1 {margin-bottom:0;}
h2 {margin-bottom:0;font-size:18px;}
ul {margin:0;}
li {list-style:none;}
</style>
</head>

<body>

<div id="container">

<div id="header">
<h1>Step1: select package -->Step2: select target env -->Step3: trigger</h1>
</div>

<div id="package">
<h2>Select Package</h2>
<form action="/upload" method="post" enctype="multipart/form-data">
  Category:      <input type="text" name="category" />
  Select a file: <input type="file" name="upload" />
  <input type="submit" value="Start upload" />
</form>
</div>

<div id="target">
<h2>Select Env</h2>
 <div style="width:50%;float:left;">
  <form method = "POST">
   <input name="name" type="text" />
   <input type="submit" value="Search Environment" />
  </form>
 </div>
 <div style="width:50%;float:right;"><button type="button">Add New Environment</button></div>
</div>

<div id="footer">Copyright</div>

</div>

</body>

</html>
