<%@ page import="com.nurik.classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/bootstrap.jsp"%>
</head>
<body>
<%
    User u  = (User) request.getSession().getAttribute("current_user");
%>
<div class="row" style="width: 100%";>
    <div class="col-sm-6" style="margin: 50px auto 0">
<form action="/edit" method="post">
    <input type="hidden" name="mail" value="<%=u.getEmail()%>">
    <div class="form-group">
        <label >Name </label>
        <input type="text" name="name" class="form-control" value="<%=u.getName()%>">
    </div>
    <div class="form-group">
        <label >Surname </label>
        <input type="text" name="surname" class="form-control"  value="<%=u.getSurname()%>">
    </div>
    <div class="form-group">
        <label >Birthdate</label>
        <input  type="date" name="bdate" class="form-control"  value="<%=u.getBirthdate()%>">
    </div>
    <div class="form-group">
        <label >City</label>
        <select class="form-control" name="city">
            <option <%if(u.getCity().equals("Aqtobe")){out.print("selected");}%> value="Aqtobe">Aqtobe</option>
            <option <%if(u.getCity().equals("Astana")){out.print("selected");}%>  value="Astana">Astana</option>
            <option <%if(u.getCity().equals("Almaty")){out.print("selected");}%>  value="Almaty">Almaty</option>
            <option <%if(u.getCity().equals("Shymkent")){out.print("selected");}%>  value="Shymkent">Shymkent</option>
        </select>
    </div>
    <div class="form-group">
        <label>Job</label>
        <input name="job" type="text" class="form-control"  value="<%=u.getJob()%>">
    </div>
    <div class="form-group">
        <label>Address</label>
        <input  name="address" type="text" class="form-control"  value="<%=u.getAddress()%>">
    </div>
    <button type="submit" class="btn btn-success mt-2 mr-5">Edit </button>
    <a href="/profile" class="btn btn-primary mt-2 ml-3">< Go back </a>
</form>
</div>
</div>
</body>
</html>
