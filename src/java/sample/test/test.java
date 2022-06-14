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
            ArrayList<CompanyDTO> listCom = new ArrayList<>();
            ArrayList<AccountDTO> listAcc = new ArrayList<>();
            for (ApplicationDTO app : listApp) {
                JobDTO job = JobDAO.getJobByID(app.getJobID());
                listJob.add(job);
                CompanyDTO com = CompanyDAO.getCompanyByID(job.getComID());
                if(job.getJobID()==com.getComID()){
                    listCom.add(com);
                }             
            }
            for (CompanyDTO com : listCom) {
                 AccountDTO acc = AccountDAO.getAccountByID(com.getAccID());
                listAcc.add(acc);
            }
//            System.out.println(listAcc.size());
//            System.out.println(listApp.size());
//            System.out.println(listCom.size());
//            System.out.println(listJob.size());
            
//            for (JobDTO job : listJob) {
//                
//                listCom.add(com);
//            }

            for (ApplicationDTO app : listApp) {
                for (JobDTO job : listJob) {                  
                            for (CompanyDTO com : listCom) {
                                for (AccountDTO acc : listAcc) {
                                if (app.getJobID() == job.getJobID()) {
                                if (job.getComID() == com.getComID()) {
                                    if (com.getAccID() == acc.getAccId()) {
                                        System.out.println(acc.getName());
                                    }
                                }
                            }
                        }

                    }
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
