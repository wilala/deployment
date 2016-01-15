<html>
<head>
<script type="text/javascript">

$=function(x){return document.getElementById(x);};
empty=function(x){return!x.replace(/\s+/g,'').length;};


function check(){
  var x=[$('env_name').value,$('app_ip').value,$('app_user').value,$('app_password').value,$('app_path').value,$('db_ip').value,$('db_user').value,$('db_password').value];
  return $('submit').disabled=empty(x[0])||empty(x[1])||empty(x[2])||empty(x[3])||empty(x[4])||empty(x[5])||empty(x[6])||empty(x[7]);
}

setInterval("check()",20);


function pass(){
  var name = document.getElementById('env_name').value;
  var ip = document.getElementById('app_ip').value;
  window.opener.setCurrnetEnv(name,ip);

}
<!--setInterval("pass()",20);-->

function submitCheck(){
  if (!check())
    {
     alert("Save successfully!");
     window.close();
    }
  else
    {
     alert("Please input necessary info!");
    }
}

</script>
</head>

<!--form method="post" target="_blank" onsubmit='window.opener=null;window.close();'-->

<form method="post" onsubmit="submitCheck();">

Env Name:
<input type="text" id='env_name' name="env_name" required="required" />
<br />

App Server IP: 
<input type="text" id='app_ip' name="app_ip" required="required" />
<br />

App Server OS User:
<input type="text" id='app_user' name="app_user" />
<br />

App Server OS Password:
<input type="text" id='app_password' name="app_password" />
<br />

App Server Deployment Path:
<input type="text" id='app_path' name="app_path" />
<br />

DB Server IP:
<input type="text" id='db_ip' name="db_ip" />
<br />


DB Server OS User:
<input type="text" id='db_user' name="db_user" />
<br />

DB Server OS Password:
<input type="text" id='db_password' name="db_password" onfocus="pass()" />
<br />

DB Server Path:
<input type="text" id='db_path' name="db_path" />
<br />

<input type="button" value="Cancel" onclick="window.close()">
<input type="submit" id="submit" value="Submit">

</form>

</html>
