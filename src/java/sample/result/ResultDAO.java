/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class ResultDAO {
    public static int insertResult(String comment, int grade,int status) throws SQLException{
        int result = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into [OJT_Result]([comment],[grade],[status]) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, comment);
                pst.setInt(2, grade);
                pst.setInt(3, status);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return result;
    }
    public static int UpdateResultApplication(int appID,int resultID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        int result=0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE [OJT_Result]\n"
                        + "SET appID=?\n"
                        + "WHERE resultID = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(2, resultID);
                pst.setInt(1, appID);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return result;
    }
}
