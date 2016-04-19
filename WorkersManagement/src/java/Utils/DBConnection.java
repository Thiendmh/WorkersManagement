/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author dinhd
 */
public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=Workers";
            try {
                conn = DriverManager.getConnection(url, "sa", "123456");
            } catch (SQLException ex) {
                ex.getStackTrace();
            }
        } catch (ClassNotFoundException ex) {
            ex.getStackTrace();
        }
        return conn;
    }
}
