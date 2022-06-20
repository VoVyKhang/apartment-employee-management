/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package management.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import management.dao.DepartmentDAO;
import management.dao.EmployeeDAO;
import management.dao.HistoryDepDAO;

/**
 *
 * @author lehon
 */
public class changeDepController extends HttpServlet {

    private static String URL = "error.jsp";
    private static final String SUCCESS_CHANGE_DEP = "mainController?action=showlist&type=changedep";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String idemp = request.getParameter("idemp");
            String newdep = request.getParameter("iddep");
            String oldep = request.getParameter("olddep");
            boolean checkChangeStatus = false;
            boolean checkInsert = false;
            int iddepold = 0;
            try {
                iddepold = DepartmentDAO.getDepNumByName(oldep);
                checkChangeStatus = HistoryDepDAO.updateDep(idemp, iddepold);
                checkInsert = HistoryDepDAO.inserNewDep(idemp, newdep);
            } catch (SQLException ex) {
                Logger.getLogger(changeDepController.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (checkChangeStatus == true && checkInsert == true) {
                HttpSession session = request.getSession(false);
                session.setAttribute("WARNING", "Completed");
                URL = SUCCESS_CHANGE_DEP;
            }

            response.sendRedirect(URL);

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
