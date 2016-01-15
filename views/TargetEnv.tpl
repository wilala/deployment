<html>
<script type="text/javascript">
function setCurrnetEnv(name,ip){
  document.getElementById('current_env_name').value = name;
  document.getElementById('current_env_ip').value = ip;
}

</script>

<div id=package>
<input name="package" type="hidden" value="{{ package }}" />
<p>Ready to deploy: {{ package }}</p>

</div>

<div style="width:400px">

<input type="button" value="add new env" onclick="window.open('/addenv')" />

</div>

<h2>Select Env</h2>

<form action="/deploy" method="get">
<table border="1">
<tr>
  <td><input type="text" id="current_env"/></td>
  <td></td>
  <td></td>
<tr>

<tr>
  <td><input type="text" id="current_env_name"/></td>
  <td><input type="text" id="current_env_ip"/></td>
  <td><input type="checkbox" value="null" id="current_en"/></td>
<tr>

<tr>
  <td>{{ envList[0][0] }}</td>
  <td>{{ envList[0][-2] }}</td>
  <td> <input name="targetenv" type="checkbox" value="{{ envList[0] }}" /></td>
</tr>
<tr>
  <td>{{ envList[1][0] }}</td>
  <td>{{ envList[1][-2] }}</td>
  <td> <input name="targetenv" type="checkbox" value="{{ envList[1] }}" /></td>
</tr>
<tr>
  <td>{{ envList[2][0] }}</td>
  <td>{{ envList[2][-2] }}</td>
  <td> <input name="targetenv" type="checkbox" value="{{ envList[2] }}" /></td>
</tr>
</table>
<input name="package" type="hidden" value="{{ package }}" />
<div style="width:400px;float:left;">
<input type="submit" value="Next step" style="float:right;"/>
</div>

</form>

</html>
