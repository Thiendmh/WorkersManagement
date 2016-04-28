/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Thiendmh
 */
public class CartDao {
    public static int getLastOrderId() {
        String sql = "SELECT TOP 1 orderId FROM tblOrders ORDER BY orderId DESC";
        Statement stm;
        try {
            stm = DBConnection.getConnection().createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1;
    }      
    
    
}
