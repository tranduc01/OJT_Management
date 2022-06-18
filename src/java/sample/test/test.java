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
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
public class test {

    public static void main(String[] args) {
        try {
            ArrayList<StudentDTO> studentList=StudentDAO.getStudents();
            ArrayList<AccountDTO> accList=new ArrayList<>();
            ArrayList<ApplicationDTO> appList=new ArrayList<>();
            for (StudentDTO stu : studentList) {
                AccountDTO acc=AccountDAO.getAccountByID(stu.getAccID());
                accList.add(acc);
                //appList=ApplicationDAO.getApplicationByID(stu.getStudentID());
            }
            for (StudentDTO stu : studentList) {
                for (AccountDTO acc : accList) {
                    if(stu.getAccID()==acc.getAccId()){
                        
                    }
                }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
