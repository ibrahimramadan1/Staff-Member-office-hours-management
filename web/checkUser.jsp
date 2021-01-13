<%-- 
    Document   : checkUser
    Created on : Jan 11, 2021, 7:52:17 PM
    Author     : Hema
--%>

<%@page import="java.lang.NullPointerException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        if (userName != null) {
            try {

                String Auser = null;
                Connection Con = null;
                PreparedStatement stmt = null;
                String query = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staffmanager";
                String user = "root";
                String Password = "hema@1234";
                Con = DriverManager.getConnection(url, user, Password);
                query = "select * from user where userName=?";
                stmt = Con.prepareStatement(query);
                stmt.setString(1, userName);
                rs = stmt.executeQuery();
                while (rs.next()) {
                    Auser = rs.getString("userName");
                }
                if (Auser == null) {
    %> <script>alert('please login');
        location.href = 'index.html';</script><%
        }
    } catch (ClassNotFoundException | SQLException ex) {
    %> <script>alert('please login');
        location.href = 'index.html';</script><%
            }
        }


    %>


