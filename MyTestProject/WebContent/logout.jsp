<%@page import="com.web.utils.MySessionCounter,java.sql.*"%>
<%
String now = (new java.util.Date()).toLocaleString();
String username = session.getAttribute("userid").toString();
Class.forName ("org.h2.Driver"); 
Connection con = DriverManager.getConnection ("jdbc:h2:~/test;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=TRUE;FILE_LOCK=NO", "sa","");
Statement st = con.createStatement();
String query = "UPDATE MEMBERS SET LASTLOGIN = '"+ now +"' where uname='"+username+"'";
st.executeUpdate(query);

MySessionCounter.removeUserDetails(username);
session.setAttribute("userid", null);
session.invalidate();
%>
<html>
   <head>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <title>User Page</title>
   </head>
<body>
<div class="alert alert-danger" >
You have been successfully logged out! You can now close the window.
</div>
</body>
</html>