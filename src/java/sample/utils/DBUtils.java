/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Tranduc
 */
public class DBUtils {
    public static Connection makeConnection() throws Exception{
        Connection cn=null;
        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://localhost\\TRANDUC:1433;databaseName=OJT_Management;user=sa;password=12345";
        Class.forName(driver);
        cn=DriverManager.getConnection(url);
        return cn;
    }
}
