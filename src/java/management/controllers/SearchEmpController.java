/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package management.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.dao.EmployeeDAO;
import management.dto.EmployeeDTO;

/**
 *
 * @author Admin
 */
public class SearchEmpController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String depname = request.getParameter("depname");
            String posname = request.getParameter("posname");
            String empname = request.getParameter("empname");
            ArrayList<EmployeeDTO> listEmp;
            if(depname == null && posname == null && empname == null) {
                listEmp = EmployeeDAO.showEmpByDep("","","");
            } else if(depname != null && posname == null && empname == null) {
                listEmp = EmployeeDAO.showEmpByDep(depname,"","");
            } else if(depname == null && posname != null && empname == null) {
                listEmp = EmployeeDAO.showEmpByDep("",posname,"");
            } else if(depname == null && posname == null && empname != null) {
                listEmp = EmployeeDAO.showEmpByDep("","",empname);
            } else if(depname != null && posname != null && empname == null) {
                listEmp = EmployeeDAO.showEmpByDep(depname,posname,"");
            } else if(depname == null && posname != null && empname != null) {
                listEmp = EmployeeDAO.showEmpByDep("",posname,empname);
            } else if(depname != null && posname == null && empname != null) {
                listEmp = EmployeeDAO.showEmpByDep(depname,"",empname);
            } else    
            listEmp = EmployeeDAO.showEmpByDep(depname,posname,empname);
            request.setAttribute("listEmp", listEmp);
            request.getRequestDispatcher("listEmp.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchEmpController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchEmpController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
