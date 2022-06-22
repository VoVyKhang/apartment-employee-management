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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.dao.CertificateDAO;
import management.dto.CertificateDTO;

/**
 *
 * @author VyNT
 */
public class AddNewCertEmpController extends HttpServlet {
    
    private final String SUCCESS = "listCertEmp.jsp";
    private final String ERROR = "addNewCertEmp.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param servlet request
     * @param servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR;
        try {
            /* TODO output your page here. You may use following sample code. */
            String cerName = request.getParameter("cerName");
            String doi = request.getParameter("cerDoi");
            String idEmp = request.getParameter("empID");
            String idTypeCer = request.getParameter("idTypeCer");
            int i = 0;
            if (cerName.equals("") || doi.equals("1900-01-01") || doi.trim().equals("")) {
                request.setAttribute("filedBlank", "Do not leave any fields blank, update fail");
                CertificateDAO dao = new CertificateDAO();
                ArrayList<CertificateDTO> listType = dao.listTypeCertificate();
                request.setAttribute("listTypeCer", listType);
                i++;
            }
            if (i == 0) {
                boolean result = CertificateDAO.insertCertificate(cerName, doi, idEmp, idTypeCer);
                if (result == true) {
                    request.setAttribute("updateSuccess", "Add success");
                    url = SUCCESS;
                } else {
                    request.setAttribute("updateFail", "Add fail");
                    url = SUCCESS;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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
