<%@ page import ="com.web.utils.MySessionCounter,java.sql.*" %>
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
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

<div class="container">
    <div class='page-header'>
        <div class='btn-toolbar pull-right'>
            <div class='btn btn-outline-danger'>
                <a href='logout.jsp' style="color: red;">Log out</a>
            </div>
        </div>
         <h2>Welcome <%=session.getAttribute("userid")%> ! </h2>

    </div>
</div>


<%
    }

MySessionCounter.setUserDetails(session.getAttribute("userid").toString());
%>

<div class="row">
  <div class="col-md-2">&nbsp;</div>
  <div class="col-md-8">
    <div class="row space-16">&nbsp;</div>
    <div class="row">
      <div class="col-sm-4">
        <div class="thumbnail">
          <center> <h3> Active Sessions : </h3> <center>
		  <center> <h1> <%= MySessionCounter.getActiveSessions() %> </h1> </center>
		  <%= MySessionCounter.getUserDetails().replace('[', ' ').replace(']', ' ')%> currently active.
		  <h6>Please refresh this page to update the panel</h6>
        </div>
      </div>
      <div class="dropdown">
    <button class="dropbtn" type="button" id="menu1" data-toggle="dropdown">
     <img src="avatar.jpg" width="200" height="150" alt="Computer Hope">
       <span class="caret"></span>
    </button>
    <ul class="dropdown-content dropdown-menu-right" role="menu" aria-labelledby="menu1">
      <%
		ResultSet resultSet = null;
		String username = session.getAttribute("userid").toString();
		Class.forName ("org.h2.Driver"); 
		Connection con = DriverManager.getConnection ("jdbc:h2:~/test;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=TRUE;FILE_LOCK=NO", "sa","");
		Statement st = con.createStatement();
		
		String sql = "select * from members where uname='"+username+"'";
		
		resultSet = st.executeQuery(sql);
		
		if(resultSet.next()){%>
		
		<b>FirstName:</b> <%= resultSet.getString("first_name")%><br>
		<b>Lastname: </b> <%= resultSet.getString("last_name")%><br>
		<b>Email:</b> <%= resultSet.getString("email")%><br>
		
		<% } %>
    </ul>
  </div>
    </div>
    <div class="col-md-2">&nbsp;</div>
  </div>
</div>
</div>

<br><br>


<div class="alert alert-success" >
  Your last Active session <%= resultSet.getString("lastlogin")%> <br>
</div>

<%
		con.close();
		ResultSet resultSet2 = null;
		String username2 = session.getAttribute("userid").toString();
		Class.forName ("org.h2.Driver"); 
		Connection con2 = DriverManager.getConnection ("jdbc:h2:~/test;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=TRUE;FILE_LOCK=NO", "sa","");
		Statement st2 = con2.createStatement();
		
		String sql2 = "select * from members where uname NOT IN('"+username+"') and lastlogin is not null";
		
		resultSet2 = st2.executeQuery(sql2);
		
		String otherLogins="";
		
		while(resultSet2.next()){
			
			otherLogins = otherLogins + resultSet2.getString("uname")+" on "+resultSet2.getString("lastlogin")+" , ";
			
		}
		
		if(otherLogins.length()>0){
			
			int index=otherLogins.lastIndexOf(",");
		
			otherLogins = new StringBuilder(otherLogins).replace(index, index+1, ".").toString();
		}
		
		else{
			
			otherLogins="No data available";
		}
		%>

<div class="alert alert-warning" >
  Users who have visited this page in the past : <%= otherLogins%>
</div>
<%con2.close(); %>
</body>
<style>
	
	.thumbnail {
   box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);
   transition: 0.3s;
   min-width: 40%;
   border-radius: 5px;
 }

 .thumbnail-description {
   min-height: 40px;
 }

 .thumbnail:hover {
   cursor: pointer;
   box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 1);
 }
 
 .tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  
  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 105%;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}

.dropbtn {
  background-color: white;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}


/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block;}


	</style>
</html>
