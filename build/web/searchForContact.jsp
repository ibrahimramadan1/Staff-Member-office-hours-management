<%-- 
    Document   : searchForContact
    Created on : Jan 12, 2021, 2:36:27 AM
    Author     : Hema
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String userName = request.getParameter("search");

    Connection Con = null;
    PreparedStatement stmt = null;
    String query = null;
    ResultSet rs = null;

    String email = null;
    String role = null;
    String name = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/staffmanager";
        String user = "root";
        String Password = "hema@1234";
        Con = DriverManager.getConnection(url, user, Password);
        query = "SELECT * FROM user"
                + " where userName=?;";

        stmt = Con.prepareStatement(query);
        stmt.setString(1, userName);
        rs = stmt.executeQuery();
        while (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            role = rs.getString("role");
        }
        if (name==null){
            %><h3>No such a person</h3><%
        }else{
        
%>
<div class="col-md-4">
    <div class="card card-user">
        <div class="image">
            <img src="img/walpaper.jpg" />
        </div>
        <div class="content">
            <div class="author">
                <img class="avatar border-gray" src="img/admin.png" />
                <h4 class="title"><%=role%>: <%=name%><br />
                    <small><%=userName%></small>
                </h4>
            </div>
            <br>
            <p class="description text-center">
                email: <%=email%>
            </p>
        </div>
    </div>
</div>
<%
        }
    } catch (ClassNotFoundException | SQLException ex) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        String stackTrace = sw.toString();
        String replace = stackTrace.replace(System.getProperty("line.separator"), "<br/>\n");
        out.println(replace);
    }

%>
