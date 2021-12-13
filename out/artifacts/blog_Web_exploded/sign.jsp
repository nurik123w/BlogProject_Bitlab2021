<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/bootstrap.jsp"%>
</head>
<div class="row" style="width: 100%;<%if(request.getParameter("gayDetected")!=null){out.print("background-color: black;");}%>">
    <div class="col-sm-3" style="margin: 50px auto 0">
        <%
            if(request.getParameter("success")!=null){
        %>
        <p class="alert alert-light mt-3"><a class="alert-link" href="/login">You will be redirected to main page automatically</a></p>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>User</strong> was added successfully.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <script>
            setTimeout(function(){
                window.location.href = '/login';
            }, 5000);
        </script>
        <%
            }
        %>
        <form action="/sign" method="post"  >
            <div class="form-group">
                <label >Name </label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label >Surname </label>
                <input type="text" name="surname" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Email </label>
                <input type="email" name="mail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            </div>
            <%
                if(request.getParameter("exists")!=null){
            %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                     This <strong>Email</strong> already exists.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            <%
                }
            %>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" name="pass" class="form-control" id="exampleInputPassword1">
            </div>
            <div class="form-group">
                <label>Retype new password</label>
                <input type="password" name="rePass" class="form-control">
            </div>
            <%
                if(request.getParameter("passError")!=null){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
               <strong>Password</strong> doesn't match.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <div class="form-group">
                <label >Birthdate</label>
                <input required  type="date" name="bdate" class="form-control">
            </div>
            <div class="form-group">
                <label >City</label>
                <select class="form-control" name="city">
                    <option selected>Select city</option>
                    <option value="Aqtobe">Aqtobe</option>
                    <option value="Astana">Astana</option>
                    <option value="Almaty">Almaty</option>
                    <option value="Shymkent">Shymkent</option>
                </select>
            </div>
            <div class="form-group">
                <label>Gender</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value="male" >
                    <label class="form-check-label" for="exampleRadios1">
                        Male
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value="female">
                    <label class="form-check-label" for="exampleRadios2">
                        Female
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="exampleRadios3" value="gay" >
                    <label class="form-check-label" for="exampleRadios3">
                        I'd prefer not to answer
                    </label>
                </div>
                <div class="form-group">
                    <label>Job</label>
                    <input name="job" type="text" class="form-control" >
                </div>

                <div class="form-group">
                    <label>Address</label>
                    <input  name="address" type="text" class="form-control">
                </div>
            </div>
            <button type="submit" class="btn btn-success mt-2 mr-5">Submit</button>
            <a href="/login" class="btn btn-primary mt-2 ml-5">< Go back </a>
        </form>
    </div>
    <%
        if(request.getParameter("gayDetected")!=null){
    %>

        <iframe src="https://giphy.com/embed/ZcYe7jWTLRzkQ"  style="margin:180px 0 " width="480" height="303" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
        <iframe src="https://giphy.com/embed/YO7P8VC7nlQlO" style="border-radius: 80px" width="401" height="480" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

         <a href="/sign" class="btn btn-danger btn-lg" style="position: absolute; bottom: 70;right: 500;font-weight: bolder; color: gold">UNGAY BUTTON</a>

    <%
        }
    %>

</div>
</body>
</html>
