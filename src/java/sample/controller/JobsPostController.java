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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
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
@WebServlet(name = "JobsPostController", urlPatterns = {"/JobsPostController"})
public class JobsPostController extends HttpServlet {

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
                /* TODO output your page here. You may use following sample code. */
            String pagenumber = request.getParameter("page");
            if (pagenumber == null) {
                pagenumber = "1";
            }
            int pageIndex = Integer.parseInt(pagenumber);
            int numofrow = 10;
            ArrayList<JobDTO> listJob1 = JobDAO.getJobsPost(pageIndex, numofrow);
            ArrayList<JobDTO> listJob = JobDAO.getJobs();
            ArrayList<CompanyDTO> listCompany = CompanyDAO.getCompanies();
            ArrayList<AccountDTO> listAccount=new ArrayList<>();
            ArrayList<MajorDTO> listMajor=MajorDAO.getMajors();
                
            int total=listJob.size()/10;
            for (CompanyDTO com : listCompany) {
                AccountDTO account=AccountDAO.getAccountByID(com.getAccID());
                if(account.getAccId()==com.getAccID()){
                listAccount.add(account);
                }
            }
            
            
            
                request.setAttribute("totalPage", total);
                request.setAttribute("companyList", listCompany);
                request.setAttribute("jobList", listJob1);
                request.setAttribute("accList", listAccount);
                request.setAttribute("majorList", listMajor);
                request.getRequestDispatcher("postManagement.jsp").forward(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
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
