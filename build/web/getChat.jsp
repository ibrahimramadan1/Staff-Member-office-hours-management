<%-- 
    Document   : getChat
    Created on : Jan 12, 2021, 3:51:18 AM
    Author     : Hema
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userName = request.getParameter("from");
    String to = request.getParameter("to");
    String clas = null;
    String mFrom = null;
    String mTo = null;
    String content = null;
    Timestamp date;

%>
<div class="contact-profile">
    <img src="img/person.png"/>
    <p><%=to%></p>
                                            
</div>
<div class="messages">
    <ul>
        <%
            Connection Con = null;
            PreparedStatement stmt = null;
            String query = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staffmanager";
                String user = "root";
                String Password = "hema@1234";
                Con = DriverManager.getConnection(url, user, Password);
                query = "SELECT * FROM staffmanager.message"
                        + " where (mFrom=? AND mTo=?) OR (mTo=? AND mFrom=?);";

                stmt = Con.prepareStatement(query);
                stmt.setString(1, userName);
                stmt.setString(2, to);
                stmt.setString(3, userName);
                stmt.setString(4, to);
                rs = stmt.executeQuery();
                while (rs.next()) {
                    mFrom = rs.getString("mFrom");
                    mTo = rs.getString("mTo");
                    content = rs.getString("content");
                    date = rs.getTimestamp("mDate");

                    if (mFrom.equals(userName)) {
                        clas = "sent";
                    } else {
                        clas = "replies";
                    }

        %>
        <li class=<%=clas%>>
            <img src="img/person.png" />
            <p>
                <%=content%>  
                <br>
                Date: 
                <%= date%>
            </p>

        </li>

        <%               clas = "";
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


    </ul>
</div>
<div class="message-input">
    <div class="wrap">
        <input type="text" placeholder="Write your message..." maxlength="200"/>
        <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
    </div>
</div>