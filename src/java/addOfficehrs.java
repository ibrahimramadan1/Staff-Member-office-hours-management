/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hema
 */
@WebServlet(urlPatterns = {"/addOfficehrs"})
public class addOfficehrs extends HttpServlet {

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
            // {userName: userName, type: type, address: address,date:daty,from:from,to:to},
            String userName = request.getParameter("userName");
            String type = request.getParameter("type");
            String address = request.getParameter("address");
            String date = request.getParameter("date");
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            try {
                SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date d1 = sdformat.parse(date);
                java.sql.Date sqlDate = new java.sql.Date(d1.getTime());
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/staffmanager";
                String user = "root";
                String Password = "hema@1234";
                Con = DriverManager.getConnection(url, user, Password);
                query = "insert into officehrs(oh_date,oh_from,oh_to,userName,type,address) values(?,?,?,?,?,?);";
                stmt = Con.prepareStatement(query);
                stmt.setDate(1, sqlDate);
                stmt.setString(2, from);
                stmt.setString(3, to);
                stmt.setString(4, userName);
                stmt.setString(5, type);
                stmt.setString(6, address);
                int counter = stmt.executeUpdate();
                if (counter == 1) {
                    out.print("{\"success\": 0}");
                } else {
                    out.print("{\"success\": 1}");
                }
            } catch (ClassNotFoundException | SQLException ex) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                ex.printStackTrace(pw);
                String stackTrace = sw.toString();
                String replace = stackTrace.replace(System.getProperty("line.separator"), "<br/>\n");
                out.println(replace);
            } catch (ParseException ex) {
                Logger.getLogger(addOfficehrs.class.getName()).log(Level.SEVERE, null, ex);
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
