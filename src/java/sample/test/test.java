/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.test;

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

/**
 *
 * @author Tranduc
 */
public class test {
    public static void main(String[] args) {
        try{
            
            AccountDTO acc=AccountDAO.loginAccount("test@fpt.edu.vn", "123456");
            System.out.println(acc);
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
}
