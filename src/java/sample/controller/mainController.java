/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tranduc
 */
public class mainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Log In";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String UPDATE="updateInfor";
    private static final String UPDATE_CONTROLLER="UpdateInforController";
    private static final String LOGOUT="logout";
    private static final String LOGOUT_CONTROLLER="LogoutController";
    private static final String JOBDETAILS="jobDetails";
    private static final String JOBDETAILS_CONTROLLER="JobDetailsController";
    private static final String CHANGEPASSWORD="ChangePassword";
    private static final String CHANGEPASSWORD_CONTROLLER="ChangePasswordController"; 
    private static final String GETAPPLICATION="GetApplication";
    private static final String GETAPPLICATION_CONTROLLER="GetApplicationController";
    private static final String COMPANYDETAILS="companyDetails";
    private static final String COMPANYDETAILS_CONTROLLER="CompanyDetailsController";
    private static final String ADMIN_STUDENT="AdminPage";
    private static final String ADMIN_STUDENT_CONTROLLER="AdminStudentController";
    private static final String INSERTAPPLICATION="InsertApplication";
    private static final String INSERTAPPLICATION_CONTROLLER="InsertApplicationController";
    


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
        String url = ERROR;
       
            /* TODO output your page here. You may use following sample code. */

            try {
                String action = request.getParameter("action");
                if(LOGIN.equals(action)){
                    url=LOGIN_CONTROLLER;
                }else if(UPDATE.equals(action)){
                    url=UPDATE_CONTROLLER;
                }else if(LOGOUT.equals(action)){
                    url=LOGOUT_CONTROLLER;
                }else if(JOBDETAILS.equals(action)){
                    url=JOBDETAILS_CONTROLLER;
                }else if(CHANGEPASSWORD.equals(action)){
                    url=CHANGEPASSWORD_CONTROLLER;
                }else if(GETAPPLICATION.equals(action)){
                    url=GETAPPLICATION_CONTROLLER;
                }else if(COMPANYDETAILS.equals(action)){
                    url=COMPANYDETAILS_CONTROLLER;
                }else if(ADMIN_STUDENT.equals(action)){
                    url=ADMIN_STUDENT_CONTROLLER;
                }else if(INSERTAPPLICATION.equals(action)){
                    url=INSERTAPPLICATION_CONTROLLER;
                }
            } catch (Exception e) {
                log("Error at mainController: " + e.toString());
            } finally {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
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
