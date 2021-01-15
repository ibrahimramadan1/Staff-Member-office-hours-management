<%-- 
    Document   : reserveMeeting
    Created on : Jan 15, 2021, 6:28:09 PM
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
            if (role == null || !role.equals("ST")) {
        %><script>alert("you're not alwoed to be here");
            location.href = 'user.jsp';</script><%
            }
        %>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <link rel="icon" href="img/logo.png">
        <title>Reserve a meeting</title>
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
                        <li class="">
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

                        <li class="active">
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

                <input id='mFrom' type='text' hidden value="<%=userName%>" />
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="text-center">
                                <button type="button" id="checkMeeting"class="btn btn-info btn-fill">check if i have meeting today</button>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><span class="pe-7s-search"></span>search for TA/DR office hours by userName</label>
                                    <input name="searchor" id="searchor" type="search" class="form-control" value="" placeholder="search">
                                </div>
                            </div>
                        </div>


                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">his office hours</h4>
                                    </div>
                                    <br>
                                    <div id="OH">
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
    <script src="js/reserveMeeting.js"></script>
</html>