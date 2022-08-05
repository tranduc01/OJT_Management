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
           
            ArrayList<ResultDTO> resultList=ResultDAO.getResults();
            ArrayList<ApplicationDTO> appList=ApplicationDAO.getApplications();
            
            
            ArrayList<JobDTO> jobList=new ArrayList<>();
            ArrayList<StudentDTO> stuList=StudentDAO.getStudents();
            
            ArrayList<CompanyDTO> comList=CompanyDAO.getCompanies();
            
            ArrayList<AccountDTO> accList=AccountDAO.getAccounts();
            

//            System.out.println(jobList.size());
for (ResultDTO resultDTO : resultList) {                          
            for (ApplicationDTO applicationDTO : appList) {                  
                        for (AccountDTO accountDTO : accList) {
                             for (StudentDTO studentDTO : stuList) {
                            if(resultDTO.getAppID()==applicationDTO.getApplyID()) 
                                if(applicationDTO.getStuID().equals(studentDTO.getStudentID())){
                                    if(studentDTO.getAccID()==accountDTO.getAccId()){
                                        System.out.println(resultDTO.getAppID());
                                        System.out.println(studentDTO.getStudentID());
                                        System.out.println(accountDTO.getName());
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
