/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.test;

import java.sql.Date;
import java.util.ArrayList;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.major.MajorDAO;
import sample.major.MajorDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
public class test {

    public static void main(String[] args) {
        try {
            ArrayList<AccountDTO> list=AccountDAO.getAccounts();
            System.out.println(list.size());
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
