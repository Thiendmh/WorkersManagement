/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.CartDao;
import Utils.LoginDao;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.LoginModel;

/**
 *
 * @author dinhd
 */
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        LoginModel loginModel = (LoginModel) session.getAttribute("login");

        if (action.equalsIgnoreCase("viewall")) {
            int jobId = Integer.parseInt(request.getParameter("txtJobId"));
            String jName = request.getParameter("txtJName");
            Double price = Double.parseDouble(request.getParameter("txtPrice"));
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Date startDate = null;
            Date endDate = null;
            try {
                startDate = sdf.parse(request.getParameter("txtStartDate"));
                endDate = sdf.parse(request.getParameter("txtEndDate"));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }            
            loginModel.addToCart(new Cart(CartDao.getLastOrderId()+1, jobId, startDate, endDate, quantity));
            session.setAttribute("login", loginModel);
            response.sendRedirect("carts_view.jsp");
        }

        if (action.equalsIgnoreCase("delete")) {
            int index = Integer.parseInt(request.getParameter("index"));
            loginModel.getCart().remove(index); 
            response.sendRedirect("carts_view.jsp");
        }
        
        if (action.equalsIgnoreCase("approve")) {
            
            response.sendRedirect("home_customer.jsp");
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
