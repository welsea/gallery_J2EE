<%@page import="util.A_work"%>
<%@page import="util.Artist"%>
<%@ page language="java"  import="java.util.*,java.sql.DriverManager" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<style>
	* {  
            margin: 0px;  
            padding: 0px;  
        }  
  
        html, body {  
            height: 100%;  
        }  
  
        .footer {  
            margin-top: -50px;  
            height: 50px;  
            background-color: #eee;  
            z-index: 9999;  
        }  
  
        .wrap {  
            min-height: 100%;  
        }  
  
        .main {  
            padding-bottom: 50px;  
        } 
	</style>

</head>
<body>
<div class="wrap">
	<div class="main">
    <!--nav-->
    <%
    String message=(String)session.getAttribute("message");
	String username=(String)session.getAttribute("username");
	if(message=="success"){
	   out.println("<div style='text-align: right;margin: 5px'>");
	       out.println(" <a href='myInfo.jsp?id="+username+"'>"+username+"</a>");
	       out.println(" <a href='logout.jsp'>Log Out</a>");
	   out.println(" </div>");
	   }else{
	 	  	out.println("<div style='text-align: right;margin: 5px'>");
	       out.println(" <a href='login.jsp'>Log In</a>");
	       out.println(" <a href='signup.jsp'>Sign Up</a>");
	   		out.println(" </div>");
	   }
	   %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin-bottom:10px;" >

      <a class="navbar-brand" href="index.jsp" style="font-family: Georgia,'Time New Roman',Times; ">Gallery</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto">
         <li class="nav-item">
            <a class="nav-link" href="sortOfA.jsp">所有艺术家</a>
          </li>
            <a class="nav-link" href="sortOfW.jsp">所有作品</a>
          </li>

        </ul>
       <form class="form-inline my-2 my-lg-0" action="findServlet">
          <input name="usr_input" class="form-control mr-sm-2" type="text" placeholder="Search">
          <button class="btn btn-secondary my-2 my-sm-0" type="submit">搜索</button>
        </form>
      </div>
    </nav>


<!--return-->
	<%
	//获取搜索结果
	List<A_work> list=(List<A_work>)session.getAttribute("list");
	String usr_input=(String)session.getAttribute("usr_input");
	String massage="";
	if(list==null || list.size()<1){
		massage="对不起，没有找到匹配结果。";
		out.println("<div style='margin: 30px'><div style='margin: auto;width:90%'>");
	       out.println(" <h2 style='font-size:20px;font-family: Georgia;margin-left: 10px '>"+ massage+"</h2>");
	       out.println(" <hr></div></div>");
	}else{
		massage=usr_input;
	%>
	<div style="margin: 30px">
		<div style="margin: auto;width:90%">
	        <h2 style="font-size:20px;font-family: Georgia;margin-left: 10px "><%= usr_input%></h2>
	        <hr>
	    </div>	
	</div>
	
	<div style="margin: auto;width: 80%">
		<div class="card-columns" style="margin: auto;">
	<%
		for(A_work work:list){
	 %>
	 	
		  <div class="card" style="width:200px">
		    <img src="http://localhost:8080/Ggllery/images/<%=work.getImg()%>" class="card-img-top" data-src="holder.js/100%x180/?text=Image cap" >
		    <div class="card-block">
		      <a href="work_info.jsp?id=<%=work.getWId()%>" ><h6 class="card-title"style="margin: 5px" ><%= work.getName_cn() %></h6></a>
		      <p class="card-text" style="margin: 5px"><%=work.getName_en() %></p>
		    </div>
		   </div>
		  
	<%
		}
	}
	 %>

		</div>
	</div>
</div>
</div>






  
    <div class="panel-footer" style="text-align: center;background-color: #f0f8ff">
      <br>
      <br>
      <br>
      <p style="color: #696969">@sxy_2015020800111 & @sxy_2015020800111</p>
      <br>

    </div>
	

	    <!-- jQuery first, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>