<%@page contentType="text/html; charset=iso-8859-1" session="true" language="java" import="java.util.*" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<LINK href="js/bootstrap.css" rel="stylesheet" type="text/css">
<title>Login</title>

<style type="text/css">
#apDiv1 {
	position:absolute;
	left:187px;
	top:145px;
	width:426px;
	height:330px;
	z-index:1;
}
#apDiv2 {
	position:absolute;
	width:482px;
	height:341px;
	z-index:2;
	left: 718px;
	top: 161px;
}
#apDiv3 {
	position:absolute;
	left:1006px;
	top:537px;
	width:71px;
	height:44px;
	z-index:3;
}
#apDiv4 {
	position:absolute;
	left:934px;
	top:561px;
	width:94px;
	height:50px;
	z-index:4;
	color: #999;
	font-weight: bold;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
#apDiv5 {
	position:absolute;
	left:1059px;
	top:318px;
	width:142px;
	height:25px;
	z-index:5;
	color: #00F;
}
#apDiv6 {
	position:absolute;
	left:701px;
	top:93px;
	width:488px;
	height:57px;
	z-index:6;
	font-size: 24px;
	font-weight: bold;
}
</style>

</head>
<body >
	<%
	if(request.getParameter("error")!=null){

	out.println(request.getParameter("error"));
	}
	%>
	
	<div id="apDiv3"><img src="ImagenesADN/10x.png" width="138" height="52"></div>
	<div id="apDiv4">Power by</div>
	<!-- div id="apDiv5">Olvido su Contrase&ntilde;a?</div-->
	<div id="apDiv6"  class="container">
	  <label for="usrname"> Login </label>
      <br/><br/>
	  <p><img src="ImagenesADN/margen.png" width="489" height="19"></p>
	</div> 
	<br/> 
	<br/>
	<input type="hidden" id="mensajeLogin" value="<%=(request.getAttribute("mensajeLogin")!=(null))?request.getAttribute("mensajeLogin"): ""%>">
                    <div id="apDiv1"><img src="ImagenesADN/logo-adnlogin.png" alt="" width="428" height="333"></div>
                    <div id="apDiv2">
    <form id="userPass" action="autenticUser" method="post">                <label for="usrname">
  <span class="glyphicon glyphicon-user">
  </span> Usuario </label> <br>
                    
                      <input name="usuario" type="textl" maxlength="40" class="form-control" placeholder="Correo Electronico"><br><br>
                      
                      <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Contrase&ntilde;a</label><br>
                      
                      <input id="password" name="password" maxlength="30" type="password" class="form-control" placeholder="Password"><br><br>
                      
                      
                      <button type="button" id="button" style="width:160px;" data-loading-text="Ingresar" class="btn btn-primary" autocomplete="off" onClick="submitLogin()"> <span class="glyphicon glyphicon-off"></span>    Ingresar </button>
                      
 </form>                     
                    </div>
</body>

<script>
inicio();

function inicio(){
	
	mensaje=document.getElementById("mensajeLogin").value;
	if(mensaje=="Usuario Invalido"){
		alert(mensaje);
	}
	
}

function submitLogin(){

	document.getElementById("userPass").submit();
	} 
</script>
</html>
