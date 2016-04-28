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
import model.LoginModel;

/**
 *
 * @author dinhd
 */
public class LoginDao {

    public static  boolean checkLogin(String username, String password) {
        boolean f = false;
        password = MD5.crypt(password);
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

    public static LoginModel checkUser(String username) {
        String sql = "Select roleId,username,userId from tblUsers where username=? and active=1";
        PreparedStatement prst;
        try {
            prst = DBConnection.getConnection().prepareStatement(sql);
            prst.setString(1, username);            
            try (ResultSet rs = prst.executeQuery()) {
                while(rs.next()){
                    LoginModel lm = new LoginModel();
                    lm.setRole(rs.getInt(1));
                    lm.setName(rs.getString(2));
                    lm.setId(rs.getInt(3)); 
                    return lm;
                }                
            }
        } catch (SQLException ex) {
            ex.getStackTrace();
        }
        return null;
    }    
    
}
