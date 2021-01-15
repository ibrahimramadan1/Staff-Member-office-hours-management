<%-- 
    Document   : getMyOH
    Created on : Jan 15, 2021, 3:25:42 PM
    Author     : Hema
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    String userName = request.getParameter("userName");
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date d1 = sdformat.parse(from);
    java.sql.Date fromDate = new java.sql.Date(d1.getTime());

    java.util.Date d2 = sdformat.parse(to);
    java.sql.Date toDate = new java.sql.Date(d2.getTime());

    Connection Con = null;
    PreparedStatement stmt = null;
    String query = null;
    ResultSet rs = null;

    int id;
    java.sql.Date oh_date = null;
    String oh_from = null;
    String oh_to = null;
    String type = null;
    String otherType = null;
    String address = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/staffmanager";
        String user = "root";
        String Password = "hema@1234";
        Con = DriverManager.getConnection(url, user, Password);
        query = "select * from officehrs where oh_date>=? and oh_date<=? and userName=?;";
        stmt = Con.prepareStatement(query);
        stmt.setDate(1, fromDate);
        stmt.setDate(2, toDate);
        stmt.setString(3, userName);
        rs = stmt.executeQuery();
        /*id int AI PK 
         oh_date date 
         oh_from varchar(7) 
         oh_to varchar(7) 
         userName varchar(50) 
         type varchar(8) 
         address*/
        while (rs.next()) {
            id = rs.getInt("id");
            oh_date = rs.getDate("oh_date");
            oh_from = rs.getString("oh_from");
            oh_to = rs.getString("oh_to");
            type = rs.getString("type");
            address = rs.getString("address");
            if (type.equals("online")) {
                otherType = "offline";
            } else {
                otherType = "online";
            }

%>


<div class="content">
    <form action="updateOH" method="get">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label>date</label>
                    <input name="date" type="date" class="form-control" value=<%=oh_date%>>
                </div>
            </div>
            <input name="id" type="hidden" class="form-control" value=<%=id%>>
            <div class="col-md-12">
                <div class="form-group">
                    <label>From</label>
                    <input type="text" name="fromHours"   class="form-control" value=<%=oh_from%>>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>to</label>
                    <input type="text" name="toHours"   class="form-control" value=<%=oh_to%>>
                </div>
            </div>            
            <div class="col-md-12">
                <div class="form-group">
                    <label for="exampleInputEmail1">type</label>
                    <select name="type"  class="form-control">
                        <option value=<%=type%>><%=type%></option>
                        <option value=<%=otherType%>><%=otherType%></option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label>place if it's offline/ URL if it's online</label>
                    <input name="address" type="text" class="form-control" value=<%=address%>>
                </div>
            </div>
        </div>
        <button type="submit" class="w-100 btn btn-info btn-fill pull-right">update</button>

        <div class="clearfix"></div>
    </form>
    <form action="deleteOH">
        <input name="id" type="hidden" class="form-control" value=<%=id%>>
        <button type="submit" class="w-100 btn btn-danger btn-fill pull-left" style="margin-top: -45px">delete</button>
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