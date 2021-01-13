<%-- 
    Document   : searchForSubject
    Created on : Jan 13, 2021, 3:19:19 PM
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

    String subject = request.getParameter("search");

    Connection Con = null;
    PreparedStatement stmt = null;
    String query = null;
    ResultSet rs = null;

    String userName = null;
    String role = null;
    String subjectName = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/staffmanager";
        String user = "root";
        String Password = "hema@1234";
        Con = DriverManager.getConnection(url, user, Password);

        query = "select name from subject where id=?;";
        stmt = Con.prepareStatement(query);
        stmt.setString(1, subject);
        rs = stmt.executeQuery();
        while (rs.next()) {
            subjectName = rs.getString("name");

        }
        if (subjectName == null) {

%><h3>No such a subject</h3><%    } else {
    query = "select user.role as role , user.userName as userName from"
            + " subject inner join user_sub on user_sub.id=?  "
            + "inner join user on user.userName= user_sub.userName;";
    stmt = Con.prepareStatement(query);
    stmt.setString(1, subject);
    rs = stmt.executeQuery();
%><div class="col-md-12">
    <div class="card">
        <div class="header">
            <h4 class="title"><%=subject%> : <%=subjectName%></h4>
        </div>
        <div class="content">
            <form id="sendMessageToSubjet">
                <div class="row">
                    <%
                        while (rs.next()) {
                            userName = rs.getString("userName");
                            role = rs.getString("role");
                            %><div class="col-md-3">
                        <div class="form-group">
                            <label><%=role%></label>
                            <input name="user" type="text" class="form-control" disabled placeholder="Company" value=<%=userName%>>
                        </div>
                    </div><%
                        }

                    %>                    
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>send a message to all subject's DRs and TAs</label>
                            <textarea name="message" id="message" maxlegnth="200" class="form-control" placeholder="your message"></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info btn-fill pull-right">Send</button>
                    <div class="clearfix"></div>
                </div>
            </form>

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
