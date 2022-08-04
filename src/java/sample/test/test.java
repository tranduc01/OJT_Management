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
import sample.result.ResultDAO;
import sample.result.ResultDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
public class test {
    public static void main(String[] args) {
        try {
           
            

            CompanyDTO company = CompanyDAO.getCompanyByAccID(2);
            ArrayList<ApplicationDTO> listApp = ApplicationDAO.getApplications();
            ArrayList<JobDTO> listJob = JobDAO.getJobByComID(company.getComID());
            ArrayList<StudentDTO> listStu = StudentDAO.getStudents();
            ArrayList<ResultDTO> listResult=ResultDAO.getResults();
            ArrayList<AccountDTO> listAcc = new ArrayList<>();            
            for (StudentDTO stu : listStu) {
                 AccountDTO acc = AccountDAO.getAccountByID(stu.getAccID());
                listAcc.add(acc);
            }
            
            for (JobDTO jobDTO : listJob) {
                for (ApplicationDTO applicationDTO : listApp) {
                    for (ResultDTO resultDTO : listResult) {                                            
                    for (StudentDTO studentDTO : listStu) {
                        for (AccountDTO accountDTO : listAcc) {                           
                            if(jobDTO.getJobID()==applicationDTO.getJobID()){
                                if(resultDTO.getAppID()==applicationDTO.getApplyID()){
                                if(applicationDTO.getStuID().equals(studentDTO.getStudentID())){
                                    if(studentDTO.getAccID()==accountDTO.getAccId()){
                                        System.out.println(accountDTO.getName());
                                    }
                                }
                            }}
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
