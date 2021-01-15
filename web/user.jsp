<%-- 
    Document   : user.jsp
    Created on : Jan 11, 2021, 7:48:31 PM
    Author     : Hema
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="checkUser.jsp"/>
    <%
        HttpSession s = null;
        String userName = null;
        String name = null;
        String email = null;
        String role = null;
        try {
            s = request.getSession(true);
            userName = s.getAttribute("userName").toString();
            name = s.getAttribute("name").toString();
            email = s.getAttribute("email").toString();
            role = s.getAttribute("role").toString();
        } catch (NullPointerException e) {
    %><script>alert('please login');
        location.href = 'index.html';</script><%
            }

        %>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <link rel="icon" href="img/logo.png">
        <title>Edit your profile</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>
        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>
        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />
        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    </head>
    <body>
        <div class="wrapper">
            <div class="sidebar" data-color="blue" data-image="img/walpaper2.jpg">
                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="#" class="simple-text">
                            Staff manager
                        </a>
                    </div>
                    <ul class="nav">
                        <li class="active">
                            <a href="user.jsp">
                                <i class="pe-7s-user"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li class="">
                            <a href="chat.jsp">
                                <i class="pe-7s-chat"></i>
                                <p>chat</p>
                            </a>
                        </li>
                        <li class="">
                            <a href="findPeople.jsp">
                                <i class="pe-7s-users"></i>
                                <p>find people</p>
                            </a>
                        </li>
                        <li class="">
                            <a href="findSubject.jsp">
                                <i class="pe-7s-notebook"></i>
                                <p>find subject</p>
                            </a>
                        </li>
                        <% if (role.equals("ST")) {
                        %>
                        <li class="">
                            <a href="reserveMeeting.jsp">
                                <i class="pe-7s-wristwatch"></i>
                                <p>Reserve a Meeting</p>
                            </a>
                        </li>
                        <li class="">
                            <a href="myReservations.jsp">
                                <i class="pe-7s-hourglass"></i>
                                <p>My Meetings</p>
                            </a>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="">
                            <a href="manageOfficeHours.jsp">
                                <i class="pe-7s-wristwatch"></i>
                                <p>manage office Hours</p>
                            </a>
                        </li>
                        <li class="">
                            <a href="officeHours.jsp">
                                <i class="pe-7s-hourglass"></i>
                                <p>my office Hours</p>
                            </a>
                        </li>
                        <%
                            }
                        %>

                    </ul>
                </div>
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="Logout.jsp">
                                        <p>Log out</p>
                                    </a>
                                </li>
                                <li class="separator hidden-lg hidden-md"></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="content">
                    <div class="container-fluid">
                        <!-- ================== Edit User Password ==================-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Profile Password</h4>
                                    </div>
                                    <div class="content">
                                        <form id="updatePass">
                                            <div class="row">
                                                <div class="alert alert-danger col-12 col-lg-12" id="bad">
                                                    <strong>Error happen!</strong>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input name="user" id="user" type="text" class="form-control" disabled placeholder="Company" value=<%=userName%>>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>new password</label>
                                                        <input name="newPass" id="newPass" type="password" class="form-control" placeholder="password" value="">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">repeat your new password</label>
                                                        <input name="newPassword" id="newPassword" type="password" class="form-control" placeholder="repeat password">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>old password</label>
                                                        <input name="pass" id="pass" type="password" class="form-control" placeholder="old password">
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Password</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ====================================================-->                      
                        <!-- ================== Edit User Name ==================-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Profile Name</h4>
                                    </div>
                                    <div class="content">
                                        <form id="updateName">
                                            <div class="row">
                                                <div class="alert alert-danger col-12 col-lg-12" id="badName">
                                                    <strong>Error happen!</strong>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input name="user" id="user" type="text" class="form-control" disabled placeholder="Company" value=<%=userName%>>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Current Profile Name</label>
                                                        <input name="oldName" id = "oldName" type="text" class="form-control" disabled placeholder="User" value=<%=name%>>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">New Name</label>
                                                        <input name="newName" id="newName" type="text" class="form-control" placeholder="Your new name">
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Name</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ====================================================-->                      
                        <!-- ================== Edit User Email ==================-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Profile Email</h4>
                                    </div>
                                    <div class="content">
                                        <form id="updateEmail">
                                            <div class="row">
                                                <div class="alert alert-danger col-12 col-lg-12" id="badEmail">
                                                    <strong>Error happen!</strong>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input name="user" id="user" type="text" class="form-control" disabled placeholder="Company" value=<%=userName%>>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Current Profile Email</label>
                                                        <input name="oldEmail" id = "oldName" type="text" class="form-control" disabled placeholder="User" value=<%=email%>>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="exampleInputEmail1">New Email</label>
                                                        <input name="newEmail" id="newEmail" type="email" class="form-control" placeholder="example@gmail.com">
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Email</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ====================================================-->                      
                        <!-- ================== Edit User Role ==================-->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Edit Profile Role</h4>
                                    </div>
                                    <div class="content">
                                        <form id="updateRole">
                                            <div class="row">
                                                <div class="alert alert-danger col-12 col-lg-12" id="badRole">
                                                    <strong>Error happen!</strong>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label>Username</label>
                                                        <input name="user" id="user" type="text" class="form-control" disabled placeholder="Company" value=<%=userName%>>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label>Current Profile Role</label>
                                                        <input name="oldRole" id = "oldRole" type="text" class="form-control" disabled placeholder="User" value=<%=role%>>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1">New role</span>
                                                    </div>
                                                    <select name="newRole" id="newRole" class="form-control">
                                                        <option value="ST">student</option>
                                                        <option value="DR">Doctor</option>
                                                        <option value="TA">Teaching assistant</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-info btn-fill pull-right">Update Role</button>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>                   

                    </div>
                </div>
            </div>
        </div>
    </body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>
    <script src="js/updateProfile.js"></script>
</html>
