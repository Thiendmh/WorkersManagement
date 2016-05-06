/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.RegisterDao;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class ReisterServlet extends HttpServlet {

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
        String ac = request.getParameter("action");
        if(ac.equals("addUser")){
            try {
                int userId = 0;
                String userName = request.getParameter("txtUsername");
                String pass = request.getParameter("txtPassword");
                int role = 2;
                String name = request.getParameter("txtName");
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Date dob = sdf.parse(request.getParameter("txtDob"));
                String tel = request.getParameter("txtTel");
                String addr = request.getParameter("txtAdd");
                String email = request.getParameter("txtEmail");
                String about = request.getParameter("txtAbout");
                byte active = 0;
                User user = new User(userId, userName, pass, role, name, dob, tel, addr, email, about, active);
                RegisterDao.addUser(user);
                response.sendRedirect("login.jsp");
            } catch (ParseException ex) {
                Logger.getLogger(ReisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        if(ac.equals("viewUsers")){
            ArrayList<User> users = new ArrayList<User>();
            users = RegisterDao.getUsers();
            HttpSession session = request.getSession();
            session.setAttribute("users", users);
            response.sendRedirect("users.jsp");
        }
        if(ac.equals("changeActive")){
            int userId = Integer.parseInt(request.getParameter("userId"));
            int active = Integer.parseInt(request.getParameter("active"));
            RegisterDao.UpdateActive(userId, active);
            response.sendRedirect("ReisterServlet?action=viewUsers");
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
