/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Atef Magdy
 */
@WebServlet(urlPatterns = {"/checkMeetings"})
public class checkMeetings extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public boolean sendMail(String to, String owner, String date) {
        String content = "Yes you have meeting In date:" + date;
        String subject = "Meeting Notification";
        /// The Sender Email And Passord
        String senderEmail = "noo6670@gmail.com";
        String senderPassword = "atef35420751";

        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", senderEmail);
        props.put("mail.smtp.password", senderPassword);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(senderEmail));
            InternetAddress toAddress = new InternetAddress(to);
            message.addRecipient(Message.RecipientType.TO, toAddress);

            /// Message Content
            message.setSubject(subject);
            message.setText(content);

            Transport transport;
            transport = session.getTransport("smtp");
            transport.connect(host, senderEmail, senderPassword);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            return true;
        } catch (AddressException ae) {
            return false;
        } catch (MessagingException ex) {
            return false;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String userName = request.getParameter("userName");
            String date = request.getParameter("date");

            SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date d1 = sdformat.parse(date);
            java.sql.Date sqlDate = new java.sql.Date(d1.getTime());

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
                query = "select id from officehrs where userName=? and oh_date=?";
                stmt = Con.prepareStatement(query);
                stmt.setString(1, userName);
                stmt.setDate(2, sqlDate);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    query = "select email from user where userName=?";
                    stmt = Con.prepareStatement(query);
                    stmt.setString(1, userName);
                    rs = stmt.executeQuery();
                    if (rs.next()) {
                        String mail = rs.getString(1);
                        boolean check = sendMail(mail, userName, date);
                        if (check) {
                            out.print("{\"success\": 0}");
                        } else {
                            out.print("{\"success\": 1}");
                        }
                    }
                } else {
                    out.print("{\"success\": 1}");
                }

            } catch (ClassNotFoundException ex) {
                Logger.getLogger(checkMeetings.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(checkMeetings.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(checkMeetings.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(checkMeetings.class.getName()).log(Level.SEVERE, null, ex);
        }
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
