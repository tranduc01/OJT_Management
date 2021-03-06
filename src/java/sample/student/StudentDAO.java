/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class StudentDAO {
    public static StudentDTO getStudentByAccount(int accID) throws SQLException{
        StudentDTO stu=null;
        Connection cn=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try {
            cn=DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [stuID],[Student].accID,[majorID],[semID],Account.email as 'Email',Account.name as 'stuName'\n"
                        + "from Student join Account on Student.accID=Account.accID\n"
                        + "where Student.accID=?";
                pst=cn.prepareStatement(sql);
                pst.setInt(1, accID);
                rs=pst.executeQuery();
                if(rs!=null && rs.next()){
                    String stuid=rs.getString("stuID");
                    String majorid=rs.getString("majorID");
                    String semid=rs.getString("semID");
                    String email=rs.getString("Email");
                    String stuname=rs.getString("stuName");
                    stu=new StudentDTO(stuname, stuid, semid, email, majorid, accID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(cn!=null) cn.close();
            if(pst!=null) pst.close();
            if(rs!=null) rs.close();
        }
        return stu;
    }
}
