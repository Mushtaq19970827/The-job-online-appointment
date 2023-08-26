 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Started</title>
 <link rel="stylesheet" href="css/style-01.css?version=1">
<style>
@import url("https://fonts.googleapis.com/css?family=Montserrat&display=swap");
body {
  width: 99%;
  height: 80vh;
  display: flex;
  justify-content: center;
  align-items: center; 
  flex-direction: column;
  background: rgb(255,243,248);
  background: radial-gradient(circle, rgba(255,243,248,1) 0%, rgba(148,187,233,1) 100%);
  .button {
    width: 300px;
    height: 50px;
    background: #f3f0f1;
    position: relative;
    background: white;
    margin-bottom: 25px;
    border-radius: 32px;
    text-align: center;
    cursor: pointer;
    transition: all 0.1s ease-in-out;
     box-shadow: -6px -6px 10px rgba(255, 255, 255, 0.8),
        6px 6px 10px rgba(0, 0, 0, 0.2);
      color: #58006c;
      line-height: 50px;
      font-family: "Montserrat", sans-serif;
      font-size: 18px;
      font-weight: bold;
    	padding-top: 10px;
    .span {
      line-height: 100px;
      font-family: "Montserrat", sans-serif;
      font-size: 12px;
      font-weight: bold;
    }&:hover{
        opacity: 0.4;
        box-shadow: -6px -6px 10px rgba(255, 255, 255, 0.8)}
    } }
}

</style>
</head>
<body>

<div id="login-box">
  <div class="left">
    <h1 style="color:#58006c;">Your Role...</h1><br>
    <div class="button" onclick="redirectToLogin('Job Hunter')"><span class="text">Job Hunter</span></div>
    <div class="button" onclick="redirectToLogin('Consultant')"><span>Consultant</span></div>
    <div class="button" onclick="redirectToLogin('Administrator')"><span>Administrator</span></div>
  </div>
  
  <div class="right">
    <div >
		
	</div>
  </div>
  <script>
  function redirectToLogin(userType) {
	  <% 
	  session.setAttribute("visitedWelcomePage", true); %>
	   var contextPath = '<%= request.getContextPath() %>';
	   
	    window.location.href = contextPath + '/login?userType=' + encodeURIComponent(userType);
  }
</script>
</div>
</body>
</html>