/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hema
 */
@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection Con = null;
            PreparedStatement stmt = null;
            String query = null;
            ResultSet rs = null;

            String userName = request.getParameter("userName");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String recaptcha = request.getParameter("recaptcha");
            String oldMail = null, oldUserName = null, password = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staffmanager";
                String user = "root";
                String Password = "hema@1234";
                Con = DriverManager.getConnection(url, user, Password);
                query = "select userName from user where userName=?";
                stmt = Con.prepareStatement(query);
                stmt.setString(1, userName);
                rs = stmt.executeQuery();
                while (rs.next()) {
                    oldUserName = rs.getString("userName");

                }

                if (oldUserName != null) {
                    out.print("{\"success\": 0}");
                } else {
                    query = "select email from user where email=?";
                    stmt = Con.prepareStatement(query);
                    stmt.setString(1, email);
                    rs = stmt.executeQuery();
                    while (rs.next()) {
                        oldMail = rs.getString("email");
                    }
                    if (oldMail != null) {
                        out.print("{\"success\": 1}");
                    } else {
                        boolean re = VerifyRecaptcha.verify(recaptcha);
                        if (re) {
                            query = "select left(uuid(),8) password;";
                            stmt = Con.prepareStatement(query);
                            rs = stmt.executeQuery();
                            while (rs.next()) {
                                password = rs.getString("password");
                            }
                            
                            query="INSERT INTO user VALUES(?,?,?,?,?);";
                            stmt = Con.prepareStatement(query);
                            stmt.setString(1, userName);
                            stmt.setString(2, name);
                            stmt.setString(3, email);
                            stmt.setString(4, password);
                            stmt.setString(5, role);
                            int counter= stmt.executeUpdate();
                            if (counter<1){
                                out.print("{\"success\": 2}");
                            }
                            else{
                                out.print("{\"success\": 3}");
                            }   
                        }
                    }
                }

            } catch (ClassNotFoundException | SQLException ex) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                ex.printStackTrace(pw);
                String stackTrace = sw.toString();
                String replace = stackTrace.replace(System.getProperty("line.separator"), "<br/>\n");
                out.println(replace);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
