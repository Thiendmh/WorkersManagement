/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Cart;

/**
 *
 * @author Thiendmh
 */
public class CartDao {

    public static String getJobName(int jobId) {
        String sql = "select jName from tblJobs where jobId = ?";
        PreparedStatement pstm;
        try {
            pstm = DBConnection.getConnection().prepareStatement(sql);
            pstm.setInt(1, jobId);
            ResultSet rs =  pstm.executeQuery();
            while(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static double getPrice(int jobId) {
        String sql = "select price from tblJobs where jobId = ?";
         PreparedStatement pstm;
        try {
            pstm = DBConnection.getConnection().prepareStatement(sql);
            pstm.setInt(1, jobId);
            ResultSet rs =  pstm.executeQuery();
            while(rs.next()){
                return rs.getDouble(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    public static String getCategoryName(int jobId) {
        String sql = "select cName from tblCategories as c "
                + "inner join tblJobs as j "
                + "on c.categoryId = j.categoryId "
                + "where jobId = ?";
        PreparedStatement pstm;
        try {
            pstm = DBConnection.getConnection().prepareStatement(sql);
            pstm.setInt(1, jobId);
            ResultSet rs =  pstm.executeQuery();
            while(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static int getLastOrderId() {
        String sql = "SELECT TOP 1 orderId FROM tblOrders ORDER BY orderId DESC";
        Statement stm;
        try {
            stm = DBConnection.getConnection().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }

    public static boolean insertOrderDetails(ArrayList cart) {
        for (Object obj : cart) {
            Cart c = (Cart) obj;
            String sql = "insert into tblOrderDetails(orderId,jobId,startDate,endDate,quantity) values(?,?,?,?,?)";
            PreparedStatement pstm;
            try {
                pstm = DBConnection.getConnection().prepareStatement(sql);
                pstm.setInt(1, c.getOrderId());
                pstm.setInt(2, c.getJobId());
                pstm.setDate(3, new java.sql.Date(c.getStartDate().getTime()));
                pstm.setDate(4, new java.sql.Date(c.getStartDate().getTime()));
                pstm.setInt(5, c.getQuantity());
                pstm.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
        }
        return true;
    }

    public static boolean insertOrders(int userId) {
        String sql = "insert into tblOrders(userId) values(?)";
        PreparedStatement pstm;
        try {
            pstm = DBConnection.getConnection().prepareStatement(sql);
            pstm.setInt(1, userId);
            return pstm.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
