/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class CompanyDAO {
    public static CompanyDTO getCompanyByID(int comID) throws SQLException{
        CompanyDTO com=null;
        Connection cn=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            cn=DBUtils.makeConnection();
            if(cn!=null){
                String sql = "select [comID],[comDescription],[comAddress],[accID]\n"
                        + "from [Company]\n"
                        + "where comID=?";
                pst=cn.prepareStatement(sql);
                pst.setInt(1, comID);
                rs=pst.executeQuery();
                if(rs!=null && rs.next()){
                    int comid=rs.getInt("comID");
                    String comdescription=rs.getString("comDescription");
                    String comaddress=rs.getString("comAddress");
                    int accid=rs.getInt("accID");
                    com=new CompanyDTO(comid, comdescription, comaddress, accid);
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(cn!=null) cn.close();
            if(pst!=null) pst.close();
            if(rs!=null) rs.close();
        }
        return com;
    } 
}
