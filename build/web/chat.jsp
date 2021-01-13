<%-- 
    Document   : chat
    Created on : Jan 12, 2021, 12:13:27 AM
    Author     : Hema
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <script src="https://use.typekit.net/hoy3lrg.js"></script>
    <script>try {
            Typekit.load({async: true});
        } catch (e) {
        }</script>
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'><link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
    <jsp:include page="checkUser.jsp"/>
    <%
        HttpSession s = null;
        String userName = null;
        try {
            s = request.getSession(true);
            userName = s.getAttribute("userName").toString();
        } catch (NullPointerException e) {
    %><script>alert('please login');
        location.href = 'index.html';</script><%
            }

        %>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <link rel="icon" href="img/logo.png">
        <title>chat</title>
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
        <link href="css/chat.css" rel="stylesheet" type="text/css"/>
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
                        <li class="active">
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
                        <div class="text-center" style="margin-top: -30px;">
                            <h3>This is not real time chat,Reload to get new messages</h3>
                        </div>
                        <div id="frame">
                            <div id="sidepanel">
                                <div id="profile">
                                    <div class="wrap">
                                        <img id="profile-img" src="img/person.png" class="online" alt="" />
                                        <p><%=userName%></p>

                                    </div>
                                </div>
                                <div id="search">
                                    <label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
                                    <input id="searchor" type="text" placeholder="Search contacts by userName" />
                                </div>
                                <div id="contacts">

                                </div>

                            </div>
                            <div class="content" id="chaty">
                                
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
    <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script src="js/manageChat.js"></script>

</html>