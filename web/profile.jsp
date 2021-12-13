<%@ page import="com.nurik.classes.User" %>
<%@ page import="com.nurik.classes.Content" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.nurik.classes.Friend" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/bootstrap.jsp"%>
</head>
<body  style="background-color: #cdcbd4" onload="getAll(),getReplies()">
    <div class="container">
        <div class="main-body">
                   <%
                       User u  = (User) request.getSession().getAttribute("current_user");
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


                                            <!-- Button trigger modal -->
                                            <button type="button" style="background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;" data-toggle="modal" data-target="#exampleModal">
                                                <img src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="Admin" class="rounded-circle" width="150">
                                            </button>

                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel1">Modal title</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden">
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Save changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            
                                            <div class="mt-3">
                                                <h4><%=u.getName()+" "+u.getSurname()%></h4>
                                                <p class="text-secondary mb-1"><%=u.getJob()%></p>
                                                <p class="text-muted font-size-sm"><%=u.getAddress()%></p>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mt-3 ">
                                    <p class="text-primary" style="margin: 20px 0 0 20px">Friends list</p>
                                    <div class="card-body d-flex  flex-wrap">

                                        <%
                                            ArrayList<Friend> users = (ArrayList<Friend>) request.getAttribute("user");
                                            if(users!=null){
                                                for(Friend us : users){
                                        %>
                                            <div style="width: 100px;">
                                                <a style="text-decoration:none;color: black;background-color: blue" href="/friends?index=<%=us.getFriend().getId()%>&id=<%=u.getId()%>">
                                                    <div style="width: 70px">
                                                        <img src="https://velotur.ru/media/images/guides/no-user-image.jpg" style="width: 100%;border-radius: 50%">
                                                    </div>
                                                    <p style="font-size: 13px"><%=us.getFriend().getName()+" "+us.getFriend().getSurname()%></p>
                                                </a>
                                            </div>
                                        <%
                                                }
                                          }
                                        %>

                                    </div>
                                </div>
                            <div class="mt-3 ">

                                <form class="form-inline my-2 my-lg-0">
                                    <input id="search-friend" class="form-control mr-sm-2" name="search" type="search" placeholder="Find a friends" aria-label="Search">

                                    <button onclick="sendRequest(<%=u.getId()%>)" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal12">
                                       Search
                                    </button>
                                </form>

                            </div>



                            <div class="modal fade" id="exampleModal12" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Result</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>

                                                <div class="modal-body">



                                                        <div class="card-body d-flex  flex-wrap" id="possible-friends">


                                                        </div>



                                                </div>

                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>

                                       </div>

                                </div>
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
                                        <%=u.getName()+" "+u.getSurname()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=u.getEmail()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Date of birth</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=u.getBirthdate()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">City</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <%=u.getCity()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Gender</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                           <%=u.getGender()%>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <a class="btn btn-info " target="__blank" href="/edit">Edit</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row gutters-sm">

                                <div class="col-sm-12 mb-3">
                                    <form action="/blog" method="post">
                                        <input type="hidden" value="<%=u.getId()%>" name="id">
                                        <textarea name="my_content"></textarea>
                                        <input class="btn btn-primary" type="submit">
                                    </form>
                                </div>

                            <%
                                ArrayList<Content> content = (ArrayList<Content>) request.getAttribute("content");
                                     if(content!=null){
                                         for(Content c : content){
                            %>

                            <div class="col-sm-12 mb-3">

                                <div class="card">
                                    <div style="display: flex;justify-content: space-between;margin: 20px 0 0 20px">

                                            <div style="display: flex;">
                                                <div style="width: 60px">
                                                   <img src="https://velotur.ru/media/images/guides/no-user-image.jpg" style="width: 100%;border-radius: 50%">
                                                </div>
                                                <div style="display: flex;flex-direction: column;margin: 0 0 0 5px">
                                                    <span class="text-primary font-weight-bold"><%=u.getName()+" "+u.getSurname()%></span>
                                                    <span style="font-size: 12px;color: #757575;"><%=c.getPostDate()%></span>
                                                </div>
                                            </div>

                                            <div>
                                                <div class="btn-group" role="group">
                                                    <button style="background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;"  id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                        <i style="color: #555c66" class="fas fa-ellipsis-h"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                                        <a href="/editBlog?index=<%=c.getId()%>" class="dropdown-item">Edit</a>
                                                        <a class="dropdown-item" href="/deleteBlog?index=<%=c.getId()%>">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>

                                    <div class="card-body" >
                                            <div class="firstChild">
                                                <%=c.getContent()%>
                                                <hr>
                                            </div>

                                            <div id="<%=c.getId()%>">

                                            </div>

                                            <hr style="margin-top: 80px">

                                            <div  id="secondChild" class="d-flex " style="position: relative;">

                                                <div style="width: 50px;margin-right: 10px">
                                                    <img style="width: 100%; border-radius: 50%" src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="">
                                                </div>

                                                <input  id="text-input" type="text" style=" padding:0 25px 0 5px ;width: 100%;border-radius: 15px" >

                                                <input type="hidden" id="user-id" value="<%=u.getId()%>">

                                                <button  onclick="sendComment(<%=c.getId()%>)" style="right: 0;top: 28%;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;position: absolute"><i class="fas fa-arrow-alt-circle-right"></i></button>

                                            </div>
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

        function sendComment(id){
              let user_id = document.getElementById("user-id");
                $('#'+id).parent().children("#secondChild").each(function (i){
                  let text = $(this).children("#text-input").val();
                    $.post("/comment",{
                        content_id : id,
                        content: text,
                        user_id: user_id.value
                    });
                    $(this).children("#text-input").val("");
                })
             getAll();
        }

        function deleteComment(id1){
            $.post("/deleteComment",{
                id:id1
            });
            getAll();
        }

        function getAll(){
                $.get("/comment",function (result){
                    let reslt = JSON.parse(result);
                    for(let i = 0;i<reslt.length;i++) {
                        let id1 = reslt[i].id;
                        let content = reslt[i].content;
                        let c_id = reslt[i].content_id;
                        let date2 = reslt[i].date;
                        let name = reslt[i].user.name;
                        let snname = reslt[i].user.surname;
                        let user_id = reslt[i].user.id;
                            $("#"+c_id).append(
                                '<div style="display: flex;flex-direction: column;align-items:center;">' +
                                '<div style="display: flex; justify-content: space-between;margin:5px 0 0 15px">' +

                                '<div style="width: 90%;display: flex">' +
                                ' <div style="width: 10%;">' +
                                '<div style="width:90%;">' +
                                '<img style="width: 100%; border-radius: 50%" src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="">' +
                                '</div>' +
                                '</div>' +

                                '<div style="width: 80%;">' +
                                '<div>' +
                                '<div style="font-weight: 500;color: blueviolet;" class="nameOfUser">' +
                                '<a href="/friends?index=' + user_id + "&id=" + id1 + '">' +
                                '<span style="color: blue">' + name + " " + snname + '</span><br>' +
                                '</a>' +
                                '</div>' +

                                ' <div class="contentOfUser">' +
                                '<span style="font-size: 12px">' + content + '</span>' +
                                '</div>' +

                                '<div style=" color: darkgray; font-size: 10px;" class="dateOfPost">' +
                                '<span style="color: #555c66;font-size: 10px">' + date2 + '<button onclick="openReplyArea(' + id1 + ')" style="margin-left: 8px;font-weight: 600;font-size: 10px;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;color: royalblue">ответить</button>  </span>' +
                                '</div>' +
                                '</div>' +
                                ' <hr/>' +
                                ' </div>' +

                                '</div>' +

                                '<div style="width: 10%;display:flex;align-self: flex-end;">' +
                                '<button  style="color: darkgray; font-weight: 600;font-size: 10px;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;"  onclick="deleteComment(' + id1 + ')">Удалить</button>' +
                                '</div>' +
                                '</div>' +

                                '<div class="' + id1 + '" style="width:75% ;display: flex;justify-content: space-between;margin:5px 0 0 0px">' +


                                '</div>' +


                                '<div id="' + id1 + id1 + '" hidden style="display: flex;width:75%;margin: 0 0 25px 0;">' +
                                '<input   id="' + id1 + '"  style="width:80%;border-radius: 10px" type="text">' +
                                '<button onclick="sendReply(' + id1 + ')" class="btn"><span style="font-size: 8px">отправить</span></button>' +
                                '</div>' +

                                '</div>'
                            );
                        }
                });
        }

        function openReplyArea(id){
            $('#'+id+id).attr("hidden",false);
        }

        function sendReply(id) {
            let inputText = $('#' + id).val()

            let u_id = document.getElementById("user-id").value;

            $.post("/sendReply", {
                comment_id: id,
                content: inputText,
                user_id: u_id
            })
            getReplies()
        }

            function getReplies(){
                $.get("/sendReply",function (result){
                    let reslt = JSON.parse(result);
                    for (let i = 0; i < reslt.length; i++) {
                        let id1 = reslt[i].id;
                        let content = reslt[i].content;
                        let c_id = reslt[i].comment_id;
                        let date2 = reslt[i].date;
                        let name = reslt[i].user.name;
                        let snname = reslt[i].user.surname;
                        let user_id = reslt[i].user.id;

                        $('.' + c_id).prepend(
                            '<div style="width: 100%;display: flex">' +
                            ' <div style="width: 10%;">' +
                            '<div style="width:90%;">' +
                            '<img style="width: 100%; border-radius: 50%" src="https://velotur.ru/media/images/guides/no-user-image.jpg" alt="">' +
                            '</div>' +
                            '</div>' +

                            '<div style="width: 80%;">' +
                            '<div>' +
                            '<div style="font-weight: 500;color: blueviolet;" class="nameOfUser">' +
                            '<a href="/friends?index=' + user_id + "&id=" + id1 + '">' +
                            '<span style="color: blue">' + name + " " + snname + '</span><br>' +
                            '</a>' +
                            '</div>' +

                            '<div class="contentOfUser">' +
                            '<span style="font-size: 12px">' + content + '</span>' +
                            '</div>' +

                            '<div style=" color: darkgray; font-size: 10px;" class="dateOfPost">' +
                            '<span style="color: #555c66;font-size: 10px">' + date2 + '<button onclick="reply()" style="margin-left: 8px;font-weight: 600;font-size: 10px;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;color: royalblue">ответить</button>  </span>' +
                            '</div>' +
                            '</div>' +
                            ' <hr/>' +
                            '</div>' +

                            '</div>' +

                            '<div style="width: 10%;display:flex;align-self: flex-end;">' +
                            '<button  style="color: darkgray; font-weight: 600;font-size: 6px;background-color: Transparent; background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;"  onclick="deleteReply(' + id1 + ')">' +
                            'Удалить' +
                            '</button>' +
                            '</div>'
                        );
                    }
                })
          }

         function deleteReply(id1){
             $.post("/deleteReply",{
                 id:id1
             });
         }




        function sendRequest(id) {
            let txt = $('#search-friend').val();
            $.get("/search", {
                search: txt
            }, function (result) {
                $('#possible-friends').html("");
                let f = JSON.parse(result);
                for (let i = 0; i < f.length; i++) {
                    $('#possible-friends').append(
                        '<div style="width: 100px;">' +
                        '<a href="/friends?index=' + f[i].id + "&id=" + id + '">' +
                        '<div style="width: 70px">' +
                        '<img src="https://velotur.ru/media/images/guides/no-user-image.jpg" style="width: 100%;border-radius: 50%">' +
                        '</div>' +
                        ' <p style="font-size: 13px">' + f[i].name + " " + f[i].surname + '</p>' +
                        '</a>' +
                        '</div>'
                    )
                }
                $('#search-friend').val("");
            })
         }



    </script>

</body>
</html>
