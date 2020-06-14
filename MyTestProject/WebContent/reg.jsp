<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Registration</title>
    </head>
    <body>
    <center>
    
    <div style="width: 500px; clear: both; margin:0 auto; padding:20px;
background:#f9f9f9;
border:2px solid #333; class="shadow-lg p-3 mb-5 bg-white rounded">
        <form method="post" action="registration.jsp">
           <div class="panel panel-default box-shadow">
            <h3>User Registration</h3> <br> <br>
            
           <div class="block"> <label style="display: inline-block;  width: 140px;  text-align: right;"> First Name : </label>  <input class="shadow bg-white rounded" type="text" name="fname" value="" /></div>  <br><br>

			 <div class="block"> <label style="display: inline-block;  width: 140px;  text-align: right;">Last name :  </label>  <input class="shadow bg-white rounded" type="text" name="lname" value="" /></div>   <br><br>

			 <div class="block"> <label style="display: inline-block;  width: 140px;  text-align: right;">Email : </label> <input class="shadow bg-white rounded" type="text" name="email" value="" /></div>   <br><br>

			 <div class="block"> <label style="display: inline-block;  width: 140px;  text-align: right;">Username : </label>     <input class="shadow bg-white rounded" type="text" name="uname" value="" /></div>   <br><br>

			 <div class="block"> <label style="display: inline-block;  width: 140px;  text-align: right;">Password :  </label>     <input class="shadow bg-white rounded" type="password" name="pass" value="" /></div>   <br> <br>

		    <input type="submit" value="Submit" class="btn btn-success"/>

			<input type="reset" value="Reset" class="btn btn-danger"/>  <br> <br>

			Already registered? <a href="index.jsp">Login Here</a>
			</div>
        </form>
        </div>
        </center>
    </body>
</html>