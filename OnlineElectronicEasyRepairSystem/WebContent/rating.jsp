<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databaseconnection.databasecon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Online Electronic Easy Repair</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
    <script src="main.js"></script>
    
</head>


<body style="background: linear-gradient(to right, rgb(198, 255, 221), rgb(251, 215, 134), rgb(247, 121, 125));">
    <!-- Main Header -->
    <header class="main-header">
        <h1>Online Electronic Easy Repair</h1>
    </header>
    <!-- Navbar -->
    <nav>
  <ul>
            <li>
                <a href="customerhome.jsp" >Home</a>
            </li>
             <li>
                <a href="book.jsp" >Book</a>
            </li>
            <li>
                <a href="viewrating.jsp" >View Ratings</a>
            </li>
             <li>
                <a href="status.jsp" >Status</a>
            </li>
             <li>
                <a href="viewbill.jsp" >View Bill</a>
             </li>
              <li>
                <a href="history.jsp" >History</a>
            </li>
            <li>
                <a href="rating.jsp" class="active" >Give Rating</a>
            </li>
              <li>
                <a href="ewaste.jsp" >E-Waste</a>
            </li>
            <li>
                <a href="index.html"  >Logout</a>
            </li>
           
        </ul>
    </nav>
    <br><br><br>
   <%
                 //  String category = request.getParameter("category");
   String address = session.getAttribute("address").toString();
try{ 
	
        Connection co = databasecon.getconnection();
        PreparedStatement pst=co.prepareStatement("select * from tech where address='"+address+"'");
        ResultSet rs=pst.executeQuery();
                    %>
<center>
                    <table class="table table-dark table-striped">
    <thead>
      <tr>
          
        <th>tUsername</th>
         <th>Technician Location</th>
        <th>Device</th>
        <th>Email</th>
        <th>Mobile</th>
        <th>Address</th>
         <th>Rating</th>
         <th>Rate Here</th>  
         
       
      </tr>
    </thead>
     <%
        while(rs.next()){
           
        %>
    <tbody>
      <tr>
         
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(4)%></td>
          <td><%=rs.getString(8)%></td>
           <td><%=rs.getString(7)%></td>
             <td><%=rs.getString(12)%></td>
            <td><button style="color:black"><a href="rating1.jsp?tusername=<%=rs.getString(1)%>&tlocation=<%=rs.getString(7)%>&device=<%=rs.getString(3)%>&address=<%=address%>&email=<%=rs.getString(4)%>&mob=<%=rs.getString(8)%>">Rating</a></button> </td>
             
            
          
      </tr>
    </tbody>
     <%
        }
        %>
  </table>
</center>
  <% }
	catch(Exception e)
	{
		out.print(e);
	}
	%>	

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- Main Footer -->
    <!-- <footer class="main-footer" style="background-color: transparent; background-image: none;">
        <p>Developed & Maintained by
            <a href="https://www.1000projects.com/" target="_blank">
                <i class="fa fa-user-circle"></i> 1000 Projects
            </a>
        </p>
    </footer> -->

</body>

</html>