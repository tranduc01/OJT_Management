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
import javax.servlet.http.HttpSession;
import sample.account.AccountDAO;
import sample.account.AccountDTO;
import sample.application.ApplicationDAO;
import sample.application.ApplicationDTO;
import sample.company.CompanyDAO;
import sample.company.CompanyDTO;
import sample.job.JobDAO;
import sample.job.JobDTO;
import sample.student.StudentDTO;

/**
 *
 * @author Tranduc
 */
@WebServlet(name = "DisplayNotiController", urlPatterns = {"/DisplayNotiController"})
public class DisplayNotiController extends HttpServlet {

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
        String url = "";
         try  {
            HttpSession session=request.getSession();
            StudentDTO student=(StudentDTO) session.getAttribute("student");          
            ArrayList<ApplicationDTO> listApp1 = ApplicationDAO.getApplicationByID(student.getStudentID());
            ArrayList<JobDTO> listJob1 = new ArrayList<>();
            ArrayList<CompanyDTO> listCom1 = CompanyDAO.getCompanies();
            ArrayList<AccountDTO> listAcc1 = new ArrayList<>();
            for (ApplicationDTO app : listApp1) {
                JobDTO job = JobDAO.getJobByID(app.getJobID());
                listJob1.add(job);
                            
            }
            for (CompanyDTO com : listCom1) {
                 AccountDTO acc = AccountDAO.getAccountByID(com.getAccID());
                listAcc1.add(acc);
            }
            String action=request.getParameter("action");
            request.setAttribute("jobList1", listJob1);
            request.setAttribute("comList1", listCom1);
            request.setAttribute("appList1", listApp1);
            request.setAttribute("accList1", listAcc1);
            if("Log In".equals(action)
                    ) {
                url = "index.jsp";
            }else if("StudentProfilePage".equals(action)){
                url="student_profile.jsp";
            }
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
             request.getRequestDispatcher(url).forward(request, response);
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
