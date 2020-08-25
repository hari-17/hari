<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList" %>




<!DOCTYPE HTML>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request for E-pass</title>
<link href="css/style_epass.css" rel="stylesheet" type="text/css"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="css/leftnav.css" rel="stylesheet" type="text/css"/>


 <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet"> 
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
 <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>

<body>
<div class="nav-c">
		<c:import url="leftnav.jsp"/>
	</div>
	
    <center>
        <h1> E-pass Details</h1>
        <form method="post" action="uploadServlet" enctype="multipart/form-data">
            <table border="0" >
                <tr>
                    <td>Name: </td>
                    <td><input  class="size-30" type="text" name="name" size="30"/></td>
                </tr>
                 <tr>
                    <td>Email: </td>
                    <td><input  class="size-30" type="text" name="email" size="30"/></td>
                </tr>
                 <tr>
                    <td>Source: </td>
                    <td><select  class="size-30"  id="state" name="source">
							<option value="Andaman & Nicobar">Andaman & Nicobar</option>
							<option value="Andhra Pradesh">Andhra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chandigarh">Chandigarh</option>
							<option value="Chattisgarh">Chattisgarh</option>
							<option value="Dadra and Nagar">Dadra and Nagar</option>
							<option value="Delhi">Delhi</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachel">Himachel Pradesh</option>
							<option value="Jammu">Jammu & Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Ladakh">Ladakh</option>
							<option value="Madhya">Madhya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Mizoram">Mizoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odisha">Odisha</option>
							<option value="Puducheery">Puducheery</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamil">Tamil Nadu</option>
							<option value="Telangana">Telangana</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="Uttar">Uttar Pradesh</option>
							<option value="West"> West Bengal</option>
					</select></td>
                </tr>
                 <tr>
                    <td>Destination: </td>
                    <td><select  class="size-30"  id="state" name="destination">
							<option value="Andaman & Nicobar">Andaman & Nicobar</option>
							<option value="Andhra Pradesh">Andhra Pradesh</option>
							<option value="Arunachal Pradesh">Arunachal Pradesh</option>
							<option value="Assam">Assam</option>
							<option value="Bihar">Bihar</option>
							<option value="Chandigarh">Chandigarh</option>
							<option value="Chattisgarh">Chattisgarh</option>
							<option value="Dadra and Nagar">Dadra and Nagar</option>
							<option value="Delhi">Delhi</option>
							<option value="Goa">Goa</option>
							<option value="Gujarat">Gujarat</option>
							<option value="Haryana">Haryana</option>
							<option value="Himachel">Himachel Pradesh</option>
							<option value="Jammu">Jammu & Kashmir</option>
							<option value="Jharkhand">Jharkhand</option>
							<option value="Karnataka">Karnataka</option>
							<option value="Kerala">Kerala</option>
							<option value="Ladakh">Ladakh</option>
							<option value="Madhya">Madhya Pradesh</option>
							<option value="Maharashtra">Maharashtra</option>
							<option value="Manipur">Manipur</option>
							<option value="Meghalaya">Meghalaya</option>
							<option value="Mizoram">Mizoram</option>
							<option value="Nagaland">Nagaland</option>
							<option value="Odisha">Odisha</option>
							<option value="Puducheery">Puducheery</option>
							<option value="Punjab">Punjab</option>
							<option value="Rajasthan">Rajasthan</option>
							<option value="Sikkim">Sikkim</option>
							<option value="Tamil">Tamil Nadu</option>
							<option value="Telangana">Telangana</option>
							<option value="Tripura">Tripura</option>
							<option value="Uttarakhand">Uttarakhand</option>
							<option value="Uttar">Uttar Pradesh</option>
							<option value="West"> West Bengal</option>
					</select></td>
                </tr>
                 <tr>
                    <td>Passenger Count:<br><em style="font-size:20px;">maximum 10 person</em></td>
                    <td><input type="number" name="passenger" class="size-30" value="2" min="0" max="10" step="1"></td>
                </tr>
                 <tr>
                    <td>Reason for Traveling: </td>
                    <td><input class="size-30" type="text" name="reason" size="30"/></td>
                </tr>
                
                <tr>
                   
                <tr>
                    <td>Proof based on the reason: </td>
                    <td><input  class="size-30" type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input class="size-30" style="cursor: pointer;" type="submit" value="Submit">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>