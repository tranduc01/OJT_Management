/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.student.StudentDAO;
import sample.student.StudentDTO;

/**
 *
 * @author Dell
 */
public class ApplicationForCompanyController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            CompanyDTO company = (CompanyDTO) session.getAttribute("company");
            ArrayList<ApplicationDTO> listApp = ApplicationDAO.getApplications();
            ArrayList<JobDTO> listJob = new ArrayList<>();
            for (ApplicationDTO app : listApp) {
                JobDTO job = JobDAO.getJobByID(app.getJobID());
                listJob.add(job);

            }
            ArrayList<AccountDTO> listAcc = new ArrayList<>();
            ArrayList<StudentDTO> listStu = StudentDAO.getStudents();
            for (StudentDTO stu : listStu) {
                AccountDTO acc = AccountDAO.getAccountByID(stu.getAccID());
                listAcc.add(acc);
            }

            request.setAttribute("jobList", listJob);
            request.setAttribute("accList", listAcc);
            request.setAttribute("appList", listApp);
            request.setAttribute("stuList", listStu);
            
//            HttpSession session=request.getSession();
//            StudentDTO student=(StudentDTO) session.getAttribute("student");
//            ArrayList<ApplicationDTO> listApp = ApplicationDAO.getApplicationByID(student.getStudentID());
//            ArrayList<JobDTO> listJob = new ArrayList<>();
//            ArrayList<CompanyDTO> listCom = CompanyDAO.getCompanies();
//            ArrayList<AccountDTO> listAcc = new ArrayList<>();
//            for (ApplicationDTO app : listApp) {
//                JobDTO job = JobDAO.getJobByID(app.getJobID());
//                listJob.add(job);
//                            
//            }
//            for (CompanyDTO com : listCom) {
//                 AccountDTO acc = AccountDAO.getAccountByID(com.getAccID());
//                listAcc.add(acc);
//            }
//            
//            request.setAttribute("jobList", listJob);
//            request.setAttribute("comList", listCom);
//            request.setAttribute("appList", listApp);
//            request.setAttribute("accList", listAcc);
            request.getRequestDispatcher("applicationForCompany.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
