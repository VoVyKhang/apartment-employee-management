/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package management.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import management.dao.CertificateDAO;

/**
 *
 * @author Admin
 */
public class SearchCerController extends HttpServlet {

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
            String empid = request.getParameter("empid");
            String typecer = request.getParameter("typecer");
            String empname = request.getParameter("empname");
            ArrayList<management.dto.CertificateDTO> listCer;
            if(empid == null && typecer == null && empname == null) {
                listCer = CertificateDAO.filterCer("","","");
            } else if(empid != null && typecer == null && empname == null) {
                listCer = CertificateDAO.filterCer(empid,"","");
            } else if(empid == null && typecer != null && empname == null) {
                listCer = CertificateDAO.filterCer("",typecer,"");
            } else if(empid == null && typecer == null && empname != null) {
                listCer = CertificateDAO.filterCer("","",empname);
            } else if(empid != null && typecer != null && empname == null) {
                listCer = CertificateDAO.filterCer(empid,typecer,"");
            } else if(empid == null && typecer != null && empname != null) {
                listCer = CertificateDAO.filterCer("",typecer,empname);
            } else if(empid != null && typecer == null && empname != null) {
                listCer = CertificateDAO.filterCer(empid,"",empname);
            } else    
            listCer = CertificateDAO.filterCer(empid,typecer,empname);
            request.setAttribute("listCer", listCer);
            request.getRequestDispatcher("listCertificate.jsp").forward(request, response);
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
            Logger.getLogger(SearchCerController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchCerController.class.getName()).log(Level.SEVERE, null, ex);
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
