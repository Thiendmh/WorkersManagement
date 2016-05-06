/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginModel;

/**
 *
 * @author dinhd
 */
public class LoginServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        String u = request.getParameter("txtUsername");
        String p = request.getParameter("txtPwd");

        if (action.equalsIgnoreCase("login")) {
            if (LoginDao.checkLogin(u, p)) {
                LoginModel loginModel = LoginDao.checkUser(u);
                if (loginModel != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("login", loginModel);
                    if (loginModel.getRole() == 1) {
                        response.sendRedirect("home_admin.jsp");
                    }
                    if (loginModel.getRole() == 2) {
                        response.sendRedirect("home_customer.jsp");
                    }
                } else {
                    request.setAttribute("error", "can not found roleId match with username!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "login fail, wrong username or password or user is not active!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }

        if (action.equalsIgnoreCase("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("login");
            response.sendRedirect("logout.jsp");
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
