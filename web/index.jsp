<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/bootstrap.jsp"%>
</head>
<body>
<body class="text-center">
<div class="row" style="width: 100%;">
    <div class="col-sm-3 " style="margin: 170px auto 0 ">
        <form class="form-signin" action="/login" method="post">
            <img class="mb-4" src="data:image/png;base64,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" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Please log in</h1>
            <%
                if(request.getParameter("mailError")!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
               Incorrect <strong>Email!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                if(request.getParameter("passError")!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                Incorrect <strong>password!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input name="n" type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
            <label for="inputPassword" class="sr-only">Password</label>
            <input name="p" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
            <p class="alert alert-light mt-3"><a class="alert-link" href="/sign">Sign up</a></p>
            <p class="mt-5 mb-3 text-muted">© 2017-2021</p>
        </form>
    </div>
</div>
</body>

</body>
</html>
