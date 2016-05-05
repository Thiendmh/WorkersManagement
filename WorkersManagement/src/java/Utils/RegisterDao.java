/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import entity.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class RegisterDao {
    public static boolean addUser(User user){
        boolean check = false;
        String sql = "INSERT INTO tblUsers VALUES (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, MD5.crypt(user.getPass()));
            ps.setInt(3, user.getRoleId());
            ps.setString(4, user.getName());
            ps.setDate(5, new java.sql.Date(user.getDob().getTime()));
            ps.setString(6, user.getTel());
            ps.setString(7, user.getAddr());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getAbout());
            ps.setInt(10, user.getActive());
            check = ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
    public static ArrayList<User> getUsers(){
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM tblUsers";
        Statement st;
        try {
            st = DBConnection.getConnection().createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt(1));
                u.setUserName(rs.getString(2));
                u.setPass(rs.getString(3));
                u.setRoleId(rs.getInt(4));
                u.setName(rs.getString(5));
                u.setDob(rs.getDate(6));
                u.setTel(rs.getString(7));
                u.setAddr(rs.getString(8));
                u.setEmail(rs.getString(9));
                u.setAbout(rs.getString(10));
                u.setActive(rs.getByte(11));
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }
    public static boolean UpdateActive(int userId,int active){
        String sql = "UPDATE tblUsers SET active = ? where userId=?";
        try {
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql);
            ps.setInt(1, active);
            ps.setInt(2, userId);
            return ps.execute();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
