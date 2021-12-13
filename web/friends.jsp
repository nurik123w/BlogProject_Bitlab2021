<%@ page import="com.nurik.classes.User" %>
<%@ page import="com.nurik.classes.Content" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >
<head>
    <title>Title</title>
    <%@include file="vendor/bootstrap.jsp"%>
</head>
<body style="background-color: #cdcbd4">
<div class="container">
    <div class="main-body">
        <%
            User u  = (User) request.getSession().getAttribute("current_user");
            User f = (User) request.getAttribute("user");
        %>
        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
            <h5 class="my-0 mr-md-auto font-weight-bold"><a href="/profile"><%=u.getName()+" "+u.getSurname()%></a></h5>
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="/out">Log out</a>
            </nav>
        </div>
        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4><%=f.getName()+" "+f.getSurname()%></h4>
                                <p class="text-secondary mb-1"><%=f.getJob()%></p>
                                <p class="text-muted font-size-sm"><%=f.getAddress()%></p>

                                <%
                                    String follow = (String) request.getAttribute("friend");
                                        if(follow.equals("follow")){
                                %>
                                <button onclick="addFriend(this,<%=f.getId()%>,<%=u.getId()%>)" id="friend" class="btn btn-primary">Follow</button>
                                <%
                                    }else{
                                %>
                                <button disabled class="btn btn-success">Following</button>
                                <%
                                    }
                                %>
                                <button class="btn btn-outline-primary">Message</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mt-3 ">

                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Full Name </h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%=f.getName()+" "+f.getSurname()%>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%=f.getEmail()%>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Date of birth</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%=f.getBirthdate()%>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">City</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%=f.getCity()%>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Gender</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%=f.getGender()%>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>

                <div class="row gutters-sm">

                    <%
                        ArrayList<Content> content = (ArrayList<Content>)request.getAttribute("content");
                        if(content!=null){
                            for(Content c : content){
                    %>

                    <div class="col-sm-12 mb-3">
                        <div class="card">
                            <div style="display: flex;justify-content: space-between;margin: 20px 0 0 20px">

                                <div style="display: flex;">
                                    <div style="width: 60px">
                                        <img  src="https://velotur.ru/media/images/guides/no-user-image.jpg" style="width: 100%;border-radius: 50%">
                                    </div>
                                    <div style="display: flex;flex-direction: column;margin: 0 0 0 5px">
                                        <span class="text-primary font-weight-bold"><%=f.getName()+" "+f.getSurname()%></span>
                                        <span style="font-size: 12px;color: #757575;"><%=c.getPostDate()%></span>
                                    </div>
                                </div>

                            </div>

                            <div class="card-body">
                                <%=c.getContent()%>
                                <hr>

                                <div class="<%=c.getId()%>">

                                </div>

                                <hr style="margin-top: 80px">
                                <div class="d-flex " style="position: relative;">
                                    <div style="width: 50px;margin-right: 10px">
                                        <img style="width: 100%; border-radius: 50%" src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="">
                                    </div>

                                    <input  type="text" style="width: 100%;border-radius: 15px" id="<%=c.getId()%>">
                                    <input type="hidden" id="user-id" value="<%=u.getId()%>">
                                    <input type="hidden" id="content-id" value="<%=c.getId()%>">
                                    <button onclick="sendComment(<%=c.getId()%>)" style="right: 0;top: 28%;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;position: absolute"><i class="fas fa-arrow-alt-circle-right"></i></button>

                                </div>
                                <a href="#"><%=c.getId()%> </a>
                            </div>
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
</div>
        <script>

            getAll()
            function sendComment(id){
                let text = $('#'+id).val();
                let user_id = document.getElementById("user-id");

                $.post("/comment",{
                    content_id : id,
                    content: text,
                    user_id: user_id.value
                });

                $('#'+id).val("");

                $('.'+id).html("");

                getAll();
            }

            function deleteComment(id1){
                $.post("/deleteComment",{
                    id:id1
                });
                getAll()
            }


            function getAll(){
                let u_id = document.getElementById("user-id").value;
                $.get("/comment",{
                    user_id:u_id
                },function (result){

                    let reslt = JSON.parse(result);
                    for(let i = 0;i<reslt.length;i++) {
                        let id1 = reslt[i].id;
                        let content = reslt[i].content;
                        let c_id = reslt[i].content_id;
                        let date2 = reslt[i].date;
                        let name = reslt[i].user.name;
                        let snname = reslt[i].user.surname;
                        let user_id = reslt[i].user.id;
                        if(u_id==user_id){
                            $("." + c_id).append(
                                '<div style="display: flex; justify-content: space-between;margin:5px 0 0 15px">'+
                                    '<div style="width: 90%;display: flex">'+
                                        ' <div style="width: 10%;">'+
                                            '<div style="width:90%;">'+
                                            '<img style="width: 100%; border-radius: 50%" src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="">' +
                                            '</div>'+
                                        '</div>'+

                                        '<div style="width: 80%;">'+
                                          '<div>'+
                                                '<div style="font-weight: 500;color: blueviolet;" class="nameOfUser">'+
                                                    '<a href="/friends?index='+user_id+"&id="+ id1+'">' +
                                                    '  <span style="color: blue">' + name + " " + snname + '</span><br>' +
                                                    '</a>' +
                                                '</div>'+

                                                ' <div class="contentOfUser">'+
                                                  '  <span style="font-size: 12px">' + content + '</span><br>' +
                                                '</div>'+

                                                '<div style=" color: darkgray; font-size: 10px;" class="dateOfPost">'+
                                                  '  <span style="color: #555c66;font-size: 10px">' + date2 + '</span>' +
                                                '</div>'+
                                            '</div>'+
                                            ' <hr/>'+
                                        ' </div>'+
                                    '</div>'+

                                    '<div style="width: 10%;display:flex;align-self: flex-end; ">'+
                                           '<button  style="color: darkgray; font-weight: 600;font-size: 10px;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;"  onclick="deleteComment('+id1+')">Удалить</button>'+
                                    '</div>'+
                                '</div>'

                            );

                        }else{
                            $("." + c_id).append(

                                '<div style="display: flex; justify-content: space-between;margin:5px 0 0 15px">'+

                                    '<div style="width: 90%;display: flex">'+
                                        '<div style="width: 10%;">'+
                                            '<div style="width:90%;">'+
                                            '<img style="width: 100%; border-radius: 50%" src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="">' +
                                            '</div>'+
                                        '</div>'+

                                        '<div style="width:90%;">'+
                                            '<div>'+
                                            '<div style="font-weight: 500;color: blueviolet;" class="nameOfUser">'+
                                            '<a href="/friends?index='+user_id+"&id="+ id1+'">' +
                                            '  <span style="color: blue">' + name + " " + snname + '</span><br>' +
                                            '</a>' +
                                            '</div>'+

                                            ' <div class="contentOfUser">'+
                                            '  <span style="font-size: 12px">' + content + '</span><br>' +
                                            '</div>'+

                                            '<div style=" color: darkgray; font-size: 10px;" class="dateOfPost">'+
                                            '  <span style="color: #555c66;font-size: 10px">' + date2 + '</span>' +
                                            '</div>'+
                                        '</div>'+
                                          ' <hr/>'+
                                        '</div>'+
                                    '</div>'+

                                '</div>'
                            );
                        }
                    }
                })
            }

            function addFriend(btn,id,id2){
                $.post("/addFriend",{
                    friend_id:id,
                    user_id:id2
                });
                $(btn).addClass("btn btn-success").text("Following").attr('disabled',true);
            }

        </script>
</body>
</html>
