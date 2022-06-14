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
        try {
            ArrayList<ApplicationDTO> listApp = ApplicationDAO.getApplicationByID("SE151204");
            ArrayList<JobDTO> listJob = new ArrayList<>();
            ArrayList<CompanyDTO> listCom = CompanyDAO.getCompanies();
            ArrayList<AccountDTO> listAcc = new ArrayList<>();
            for (ApplicationDTO app : listApp) {
                JobDTO job = JobDAO.getJobByID(app.getJobID());
                listJob.add(job);
                            
            }
            for (CompanyDTO com : listCom) {
                 AccountDTO acc = AccountDAO.getAccountByID(com.getAccID());
                listAcc.add(acc);
            }
      
            System.out.println(listAcc.size());
            System.out.println(listApp.size());
            System.out.println(listCom.size());
            System.out.println(listJob.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
