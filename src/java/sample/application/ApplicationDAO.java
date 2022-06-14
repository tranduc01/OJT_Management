/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.application;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class ApplicationDAO {
    public static ArrayList<ApplicationDTO> getApplicationByID(String stuID) throws SQLException{
        ArrayList<ApplicationDTO> list=new ArrayList<>();
        ApplicationDTO app=null;
        Connection cn=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            cn=DBUtils.makeConnection();
            if(cn!=null){
                String sql = "select [applyID],[applyDate],[stuID],[jobID],[status],[resultID],[stu_confirm],[com_comfirm]\n"
                        + "from Application\n"
                        + "where stuID=?";
                pst=cn.prepareStatement(sql);
                pst.setString(1, stuID);
                rs=pst.executeQuery();
                while(rs!=null && rs.next()){
                    int applyID=rs.getInt("applyID");
                    Date applyDate=rs.getDate("applyDate");
                    String stuid=rs.getString("stuID");                  
                    int jobID=rs.getInt("jobID");
                    int status=rs.getInt("status");
                    int resultid=rs.getInt("resultID");
                    int stuconfirm=rs.getInt("stu_confirm");
                    int comconfirm=rs.getInt("com_comfirm");
                    app=new ApplicationDTO(applyID, applyDate, stuid, jobID, status, stuconfirm, comconfirm, resultid);
                    list.add(app);
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(cn!=null) cn.close();
            if(pst!=null) pst.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
}
