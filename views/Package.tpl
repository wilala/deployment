<html>
<h1>select package</h1>

<body>
<h2>Select Package</h2>
<form action="/upload" method="post" enctype="multipart/form-data">
  <input type="file" name="upload" />
  <input type="submit" value="Start upload" />
</form>

<form action="/env" method="get">
<table border="1">
<tr>
  <td>{{ package_list[-2] }}</td>
  <td>{{ package_list[-1] }}</td>
  <td> <input name="package" type="checkbox" value="{{ package_list[-2] }}" /></td>
</tr>
<tr>
  <td>{{ package_list[-4] }}</td>
  <td>{{ package_list[-3] }}</td>
  <td> <input name="package" type="checkbox" value="{{ package_list[-4] }}" /></td>
</tr>
<tr>
  <td>{{ package_list[-6] }}</td>
  <td>{{ package_list[-5] }}</td>
  <td> <input name="package" type="checkbox" value="{{ package_list[-6] }}" /></td>
</tr>
</table>

<div style="width:400px;float:left;">
<input type="submit" value="Next step" style="float:right;"/>
</div>

</form>




</body>
</html>
