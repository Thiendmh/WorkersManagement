/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dinhd
 */
public class LoginDao {

    public static  boolean checkLogin(String username, String password) {
        boolean f = false;
        String sql = "Select * from tblUsers where username=? and pwd=?";
        PreparedStatement prst;
        try {
            prst = DBConnection.getConnection().prepareStatement(sql);
            prst.setString(1, username);
            prst.setString(2, password);
            try (ResultSet rs = prst.executeQuery()) {
                f = rs.next();
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return f;
    }

    public static int checkUser(String username) {
        String sql = "Select roleId from tblUsers where username=?";
        PreparedStatement prst;
        try {
            prst = DBConnection.getConnection().prepareStatement(sql);
            prst.setString(1, username);            
            try (ResultSet rs = prst.executeQuery()) {
                while(rs.next()){
                    return rs.getInt(1);
                }                
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return -1;
    }
    
}
