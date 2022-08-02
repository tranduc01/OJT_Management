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
import java.sql.Statement;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author Tranduc
 */
public class CompanyDAO {

    public static CompanyDTO getCompanyByID(int comID) throws SQLException {
        CompanyDTO com = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [comID],[comDescription],[comAddress],website,bannerImage,[accID]\n"
                        + "from [Company]\n"
                        + "where comID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, comID);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int comid = rs.getInt("comID");
                    String comdescription = rs.getString("comDescription");
                    String comaddress = rs.getString("comAddress");
                    int accid = rs.getInt("accID");
                    String website = rs.getString("website");
                    String banner = rs.getString("bannerImage");
                    com = new CompanyDTO(comid, comdescription, comaddress, accid, website, banner);
                }
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
            if (rs != null) {
                rs.close();
            }
        }
        return com;
    }

    public static CompanyDTO getCompanyByAccID(int accID) throws SQLException {
        CompanyDTO com = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [comID],[comDescription],[comAddress],website,bannerImage,[accID]\n"
                        + "from [Company]\n"
                        + "where accID=?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, accID);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int comid = rs.getInt("comID");
                    String comdescription = rs.getString("comDescription");
                    String comaddress = rs.getString("comAddress");
                    int accid = rs.getInt("accID");
                    String website = rs.getString("website");
                    String banner = rs.getString("bannerImage");
                    com = new CompanyDTO(comid, comdescription, comaddress, accid, website, banner);
                }
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
            if (rs != null) {
                rs.close();
            }
        }
        return com;
    }

    public static ArrayList<CompanyDTO> getCompanies() throws SQLException {
        ArrayList<CompanyDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [comID],[comDescription],[comAddress],website,bannerImage,Company.[accID]\n"
                        + "from [dbo].[Company] join Account on Company.accID=Account.accID\n"
                        + "where Account.status=1";

                st = cn.createStatement();

                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int comid = rs.getInt("comID");
                    String comdescription = rs.getString("comDescription");
                    String comaddress = rs.getString("comAddress");
                    int accid = rs.getInt("accID");
                    String website = rs.getString("website");
                    String banner = rs.getString("bannerImage");
                    CompanyDTO com = new CompanyDTO(comid, comdescription, comaddress, accid, website, banner);
                    list.add(com);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }
    public static ArrayList<CompanyDTO> getCompaniesV2() throws SQLException {
        ArrayList<CompanyDTO> list = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select [comID],[comDescription],[comAddress],website,bannerImage,[accID]\n"
                        + "from [dbo].[Company]";
                        

                st = cn.createStatement();

                rs = st.executeQuery(sql);
                while (rs != null && rs.next()) {
                    int comid = rs.getInt("comID");
                    String comdescription = rs.getString("comDescription");
                    String comaddress = rs.getString("comAddress");
                    int accid = rs.getInt("accID");
                    String website = rs.getString("website");
                    String banner = rs.getString("bannerImage");
                    CompanyDTO com = new CompanyDTO(comid, comdescription, comaddress, accid, website, banner);
                    list.add(com);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }
}
