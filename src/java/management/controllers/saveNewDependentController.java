/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import management.dao.DependentDAO;
import management.dto.DependentDTO;
import management.regex.RegexEmp;

/**
 *
 * @author AD
 */
public class saveNewDependentController extends HttpServlet {

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
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String relationship = request.getParameter("relationship");
            String EmpId = request.getParameter("empId");
            String idEmp = request.getParameter("idEmp");
            int i = 0;
            boolean checkName = RegexEmp.checkEmpName(name);
            boolean checkRelationship = RegexEmp.checkEmpName(relationship);
            boolean checkDob = RegexEmp.checkValidationDob(dob);
            if (name.equals("") || dob.equals("0000-00-00") || gender.equals("") || relationship.equals("") || EmpId.equals("")) {
                request.setAttribute("filedBlank", "Do not leave any fields blank, update fail");
                request.getRequestDispatcher("addNewDependentController").forward(request, response);
                i++;
            }

            if (checkName == false) {
                request.setAttribute("nameInvalid", "Only contain Alphabet(Upper case or Lower case) and space and length 4 -> 30");
                request.getRequestDispatcher("addNewDependentController").forward(request, response);
                i++;
            }

            if (checkRelationship == false) {
                request.setAttribute("checkRelationship", "Only contain Alphabet(Upper case or Lower case) and space and length 4 -> 30");
                request.getRequestDispatcher("addNewDependentController").forward(request, response);
                i++;
            }

            if (checkDob == false) {
                request.setAttribute("checkDob", "Can only enter the date before today");
                request.getRequestDispatcher("addNewDependentController").forward(request, response);
                i++;
            }

            if (i == 0) {
                boolean result = DependentDAO.insertDependent(name, gender, dob, relationship, EmpId);
                if (result == true) {
                    if (idEmp == null) {
                        request.setAttribute("Success", "Success");
                        request.setAttribute("idEmp", "");
                        request.getRequestDispatcher("addNewDependentController").forward(request, response);
                    } else {
                        request.setAttribute("Success", "Success");
                        request.setAttribute("idEmp", idEmp);
                        request.getRequestDispatcher("addNewDependentController").forward(request, response);
                    }
                } else {
                    if (idEmp == null) {
                        request.setAttribute("Fail", "Fail");
                        request.setAttribute("idEmp", "");
                        request.getRequestDispatcher("addNewDependentController").forward(request, response);
                    } else {
                        request.setAttribute("Fail", "Fail");
                        request.setAttribute("idEmp", idEmp);
                        request.getRequestDispatcher("addNewDependentController").forward(request, response);
                    }
                }
            }
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
            Logger.getLogger(saveNewDependentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(saveNewDependentController.class.getName()).log(Level.SEVERE, null, ex);
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
