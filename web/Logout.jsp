<%-- 
    Document   : Logout
    Created on : Jan 11, 2021, 10:00:02 PM
    Author     : Hema
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession s = request.getSession(true);
    s.invalidate();
    response.sendRedirect("index.html");
%>

