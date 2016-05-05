/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Utils.Order_management;
import entity.Order;
import entity.OrderDetails;
import entity.Worker;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class OrderMgmtServlet extends HttpServlet {

    int orderId = 0;
    Date stDate=null;
    Date endDate=null;
    int jobId=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String ac = request.getParameter("action");
        if(ac.equals("viewOrder")){
            ArrayList<Order> listOrder = Order_management.getOder();
            HttpSession session = request.getSession();
            session.setAttribute("orders", listOrder);
            response.sendRedirect("order_management.jsp");
        }
        if(ac.equals("viewOrderDetails")){
            orderId = Integer.parseInt(request.getParameter("orderId"));
            ArrayList<OrderDetails> listDetails = Order_management.getOrderDetails(orderId);
            HttpSession session = request.getSession();
            session.setAttribute("orderDetails", listDetails);
            response.sendRedirect("OrderDetails.jsp");
        }
        
        if(ac.equals("workerFreeTime")){
            try {
                jobId = Integer.parseInt(request.getParameter("jobId"));
                int cateId = Order_management.getCateId(jobId);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                stDate = sdf.parse(request.getParameter("stDate"));
                endDate = sdf.parse(request.getParameter("endDate"));
                ArrayList<Worker> listWorker = Order_management.getWorkerFreeTime(cateId, stDate, endDate);
                HttpSession session = request.getSession();
                session.setAttribute("workers", listWorker);
                response.sendRedirect("WorkersinJob.jsp");
            } catch (ParseException ex) {
                Logger.getLogger(OrderMgmtServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if(ac.equals("addWIJ")){
            String[] items = request.getParameterValues("selectedItems");
            for (String item : items) {
                int workerId = Integer.parseInt(item);
                Order_management.addWIJ(jobId, workerId, stDate, endDate);
            }
            Order_management.UpdateActive(orderId, 1);
            response.sendRedirect("OrderMgmtServlet?action=viewOrderDetails&orderId="+orderId);
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
