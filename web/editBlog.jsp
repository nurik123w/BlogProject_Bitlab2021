<%@ page import="com.nurik.classes.Content" %>
<%@ page import="com.nurik.classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/bootstrap.jsp"%>
</head>
<body>
<%
    Content content =(Content) request.getAttribute("content");
    System.out.println(content);
    User u  = (User) request.getSession().getAttribute("current_user");
%>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-bold"><a href="/profile"><%=u.getName()+" "+u.getSurname()%></a></h5>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="/out">Log out</a>
    </nav>
</div>
    <div class="row">
        <div class="col-8  offset-2 mt-5">
            <form action="/editBlog" method="post">
            <textarea  name="blog">
                <%=content.getContent()%>
            </textarea>
                <input type="hidden" value="<%=content.getId()%>" name="id">
                <input class="btn btn-primary " type="submit">
                <a href="/profile" class="btn btn-secondary">< back</a>
            </form>
        </div>
    </div>
</body>
</html>
