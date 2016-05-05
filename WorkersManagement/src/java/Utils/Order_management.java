/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import entity.Order;
import entity.OrderDetails;
import entity.Worker;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class Order_management {
    public static  ArrayList<Order> getOder(){
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT orderId,username,orderDate,o.active FROM "
                + "tblOrders o inner join tblUsers u on o.userId = u.userId";
        try {
                ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
                while (rs.next()) {                
                    Order o = new Order();
                    o.setOderId(rs.getInt(1));
                    o.setUserName(rs.getString(2));
                    o.setOrderDate(rs.getDate(3));
                    o.setActive(rs.getByte(4));
                    list.add(o);
                }
            } catch (SQLException ex) {
            Logger.getLogger(Order_management.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static ArrayList<OrderDetails> getOrderDetails(int orderId){
        ArrayList<OrderDetails> list = new ArrayList<>();
        String sql = "SELECT orderId,o.jobId,j.jName,startDate,endDate,quantity,o.active "
                + "FROM tblOrderDetails o inner join tblJobs j on o.jobId = j.jobId WHERE orderId="+orderId;
        try {
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {                
                OrderDetails od = new OrderDetails();
                od.setOrderId(rs.getInt(1));
                od.setJobId(rs.getInt(2));
                od.setJobName(rs.getString(3));
                od.setStDate(rs.getDate(4));
                od.setEndDate(rs.getDate(5));
                od.setQuantity(rs.getInt(6));
                od.setActive(rs.getByte(7));
                list.add(od);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Order_management.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static int getCateId(int jobId){
        int cateId=0;
        String sql = "SELECT categoryId FROM tblJobs WHERE jobId="+jobId;
        try {
            Statement st = DBConnection.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                cateId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Order_management.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cateId;
    }
    public static ArrayList<Worker> getWorkerFreeTime(int cateId, Date stDate, Date endDate){
        ArrayList<Worker> workers = new ArrayList<Worker>();
        String sql = "exec workersFreeTime @cateID = ?, @stDate = ?,@endDate = ?";
        PreparedStatement ps;
        try {
            ps = DBConnection.getConnection().prepareStatement(sql);
            ps.setInt(1, cateId);
            ps.setDate(2, new java.sql.Date(stDate.getTime()));
            ps.setDate(3, new java.sql.Date(endDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Worker worker = new Worker();
                worker.setWorkerId(rs.getInt(1));
                worker.setWorkerName(rs.getString(3));
                worker.setTel(rs.getString(5));
                worker.setAddr(rs.getString(6));
                worker.setEmail(rs.getString(7));
                worker.setAbout(rs.getString(8));
                workers.add(worker);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Order_management.class.getName()).log(Level.SEVERE, null, ex);
        }
        return workers;
    }
    public static boolean addWIJ(int jobId, int wokerId,Date stDate, Date endDate){
        String sql = "INSERT INTO tblWorkersInJobs(jobId,workerId,startDate,endDate,active) "
                + "VALUES(?,?,?,?,1)";
        try {
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql);
            ps.setInt(1, jobId);
            ps.setInt(2, wokerId);
            ps.setDate(3, new java.sql.Date(stDate.getTime()));
            ps.setDate(4, new java.sql.Date(endDate.getTime()));
            return ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(Order_management.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static boolean UpdateActive(int orderId,int active){
        String sql = "UPDATE tblOrderDetails SET active = ? where orderId=?";
        try {
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql);
            ps.setInt(1, active);
            ps.setInt(2, orderId);
            return ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
