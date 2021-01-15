<%-- 
    Document   : searchForOH
    Created on : Jan 15, 2021, 6:53:31 PM
    Author     : Hema
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String userName = request.getParameter("userName");
    String search = request.getParameter("search");
    String date = request.getParameter("date");
    SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date d1 = sdformat.parse(date);
    java.sql.Date fromDate = new java.sql.Date(d1.getTime());

    Connection Con = null;
    PreparedStatement stmt = null;
    String query = null;
    ResultSet rs = null;

    int id;
    java.sql.Date oh_date = null;
    String oh_from = null;
    String oh_to = null;
    String type = null;
    String address = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/staffmanager";
        String user = "root";
        String Password = "hema@1234";
        Con = DriverManager.getConnection(url, user, Password);
        query = "select * from officehrs where oh_date>=? and userName=?;";
        stmt = Con.prepareStatement(query);
        stmt.setDate(1, fromDate);
        stmt.setString(2, search);
        rs = stmt.executeQuery();

        while (rs.next()) {
            id = rs.getInt("id");
            oh_date = rs.getDate("oh_date");
            oh_from = rs.getString("oh_from");
            oh_to = rs.getString("oh_to");
            type = rs.getString("type");
            address = rs.getString("address");


%>
<div class="content">
    <form action="reserve" method="get">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>date</label>
                    <input name="date" type="date" disabled class="form-control" value=<%=oh_date%>>
                </div>
            </div>
                <div class="col-md-4">
                <div class="form-group">
                    <label>From</label>
                    <input type="text" name="fromHours"  disabled class="form-control" value=<%=oh_from%>>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>to</label>
                    <input type="text" name="toHours"  disabled class="form-control" value=<%=oh_to%>>
                </div>
            </div>            
            <div class="col-md-4">
                <div class="form-group">
                    <label for="exampleInputEmail1">type</label>
                    <input name="type" type="text" disabled class="form-control" value=<%=type%>>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>place if it's offline/ URL if it's online</label>
                    <input name="address" type="text" disabled class="form-control" value=<%=address%>>
                </div>
            </div>
            <input name="id" type="hidden" class="form-control" value=<%=id%>>
            <input name="userName" type="hidden" class="form-control" value=<%=userName%>>
            
        </div>
        <button type="submit" class="w-100 btn btn-info btn-fill pull-right">reserve</button>
        <div class="clearfix"></div>
    </form>
</div>
<hr>
<%}
    } catch (ClassNotFoundException | SQLException ex) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        String stackTrace = sw.toString();
        String replace = stackTrace.replace(System.getProperty("line.separator"), "<br/>\n");
        out.println(replace);
    }
%>
